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
    json_response 200, 'cart.json'
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
