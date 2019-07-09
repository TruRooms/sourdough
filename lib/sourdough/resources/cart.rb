module Sourdough
  class Cart < Resource

    class << self
    	# Finds a cart
    	# @param cart_id [String]
    	# @return [Sourdough::Cart]
      def find cart_id
      	body = perform_request(:get, "/carts/#{cart_id}")
      	Sourdough::Cart.new(body['id'], body)
      end

      # Creates a cart
      # @param opts [Hash] https://docs.getbread.com/api/api/#create-a-cart
      def create opts
      	body = perform_request(:post, "/carts", {}, opts)
      	Sourdough::Cart.new(body: body)
      end

      def expire cart_id
      	perform_request(:post, "carts/#{cart_id}/expire")
      end

      def email cart_id, email, name
      	perform_request(:post, "carts/#{cart_id}/email", {}, {email: email, name: name})
      end

      def text cart_id, phone
      	perform_request(:post, "carts/#{cart_id}/text", {}, {phone: phone})
      end
    end

    # Expires an instance of a cart
    def expire
    	self.class.expire(id)
    end

    # Emails a cart to a user
    # @param email [String]
    # @param name [String]
    def email email, name
    	self.class.email(id, email, name)
    end

    # Texts the cart to a customer
    # @param phone [String] Phone number with country code, no formatting
    def text phone
    	self.class.text(id, phone)
    end

  end
end
