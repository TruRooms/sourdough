RSpec.describe Sourdough::Cart do

  before do
    Sourdough.api_key = 'TEST_API_KEY'
    Sourdough.secret_key = 'TEST_SECRET_KEY'
  end

  it "has a find method" do
    expect(Sourdough::Cart).to respond_to(:find) 
  end

  it "finds a cart" do
    cart = Sourdough::Cart.find('TEST_CART_ID')
    expect(cart).to be_a(Sourdough::Cart) 
  end

  it "raises an exception on not found" do
    expect{Sourdough::Cart.find('NOT_FOUND_ID')}.to raise_error(Sourdough::InvalidRequestError)
  end

  it "creates a cart" do
  end

  it "expires a cart" do
  end

  it "emails a cart" do
    expect(Sourdough::Cart.email('TEST_CART_ID', 'test@test.com', 'test name')).to eq({"message"=>"Email Sent."}) 
  end

  it "texts a cart" do
  end

end
