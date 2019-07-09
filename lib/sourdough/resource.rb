module Sourdough
	class Resource

		class << self
			def perform_request method, path, headers: {}, params: {}
				request = Sourdough::Request.new(method, path, headers, params)
				request.perform
			end
		end

		attr_accessor :id, :body

		def initialize id=nil, body=nil
			id = id
			body = body
		end
	end
end
