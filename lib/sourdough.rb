require "faraday"
require "json"

require "sourdough/resource"
require "sourdough/resources/cart"

require "sourdough/request"

require "sourdough/errors"

require "sourdough/version"

module Sourdough

	class << self
		attr_accessor :api_key, :secret_key, :sandbox

		def api_base
			if sandbox
				'https://api-sandbox.getbread.com'
			else
				'https://api.getbread.com'
			end
		end

	end

end
