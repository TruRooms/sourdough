class FakeBread < Sinatra::Base

  get '/transactions/:tx_id' do
    json_response 200, 'transaction.json'
  end

  put '/transactions/:tx_id' do
    json_response 200, 'transaction.json'
  end

  post 'transactions/actions/:tx_id' do
  end

  get '/carts/:cart_id' do
    if params[:cart_id] == 'TEST_CART_ID'
      json_response 200, 'cart.json'
    else
      content_type :json
      status 404
    end
  end

  post '/carts/:cart_id/email' do
    content_type :json
    status 200
    {"message"=>"Email Sent."}.to_json
  end

  post '/carts/:cart_id/text' do
    content_type :json
    status 200
    {"message"=>"SMS Sent."}.to_json
  end


  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

  def authenticate_user
  end
  
end
