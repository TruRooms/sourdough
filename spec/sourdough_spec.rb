RSpec.describe Sourdough do
  it "has a version number" do
    expect(Sourdough::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "can be configured" do
  	Sourdough.api_key = 'TEST_API_KEY'
  	Sourdough.secret_key = 'TEST_SECRET_KEY'
  	expect(Sourdough.api_key).to eq('TEST_API_KEY')
  	expect(Sourdough.secret_key).to eq('TEST_SECRET_KEY')
  end

  it "should have the correct API Base depending on sandbox opt" do
    expect(Sourdough.api_base).to eq('https://api.getbread.com')
    Sourdough.sandbox = true
    expect(Sourdough.api_base).to eq('https://api-sandbox.getbread.com')
  end
end
