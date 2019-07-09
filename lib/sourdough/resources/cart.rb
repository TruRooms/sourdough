module Sourdough
  class Cart < Resource

    class << self
      def find cart_id
      	body = perform_request(:get, "/carts/#{cart_id}")
      	Sourdough::Cart.new(id: body['id'], body: body)
      end

      def create opts
      end

      def expire cart_id
      end

      def email cart_id
      end

      def text
      end
    end

    def expire
    	self.class.expire(id)
    end

    def email
    	self.class.email(id)
    end

    def text
    	self.class.text
    end

  end
end
