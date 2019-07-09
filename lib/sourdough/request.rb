module Sourdough
	class Request

		def initialize method, path, headers, params
			@method = method
			@path = path
			@headers = headers
			@params = params
		end

		def perform
			api_key ||= Sourdough.api_key
    	secret_key ||= Sourdough.secret_key

    	check_api_key!(api_key)

    	conn.basic_auth api_key, secret_key

    	@headers.merge!({'Content-Type': 'application/json'})

    	resp = conn.run_request(@method.to_sym, @path, @params.to_json, @headers)

    	if [400,404,401,403,429,500].include?(resp.status)
    		raise specific_api_error(resp)
    	end

    	begin
    		if resp.status == 204
    			resp_body = true
    		else
    			resp_body = JSON.parse(resp.body)
    		end
    	rescue JSON::ParserError
    		raise general_api_error(resp.status, resp.body)
    	end

    	return resp_body
		end

		private

		def conn
	  	@conn ||= Faraday.new(url: Sourdough.api_base) # create a new Connection with base URL
	  end

		def check_api_key!(api_key)
	    unless api_key
	      raise AuthenticationError, "No API key provided."
	    end
	  end

	  def general_api_error(status, body)
      APIError.new("Invalid response object from API: #{body.inspect} " \
                   "(HTTP response code was #{status})",
                   http_status: status, http_body: body)
    end

    def specific_api_error(resp)
      # The standard set of arguments that can be used to initialize most of
      # the exceptions.
      opts = {
        http_body: resp.body,
        http_headers: resp.headers,
        http_status: resp.status,
        json_body: resp.body,
      }

      message = "#{resp.body} (#{resp.status})"

      case resp.status
      when 400, 404
        InvalidRequestError.new(message, opts)
      when 401
        AuthenticationError.new(message,opts)
      when 403
        PermissionError.new(message, opts)
      when 429
        RateLimitError.new(message, opts)
      else
        APIError.new(message, opts)
      end
    end

  end
end
