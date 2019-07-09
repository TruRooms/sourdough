RSpec.describe Sourdough::Cart do

  before do
    Sourdough.api_key = 'TEST_API_KEY'
    Sourdough.secret_key = 'TEST_SECRET_KEY'
  end

  it "has a find method" do
    expect(Sourdough::Cart).to respond_to(:find) 
  end

  it "find a cart" do
    cart = Sourdough::Cart.find('TEST_CART_KEY')
    expect(cart).to be_a(Sourdough::Cart) 
  end

  it "should raise an exception" do
  end

end
