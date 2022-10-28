RSpec.describe 'Ecommerce Tests' do
  before(:context) do
    puts("Before context")
  end
  before(:all) do
    puts("Before all")
  end
  before(:each) do
    puts("Before each")
  end

  context "Test Strings match" do
    it "should match string" do
      expect("Ruby RSPEC tests").to eq("Ruby RSPEC tests")
      puts("--Test Strings match--")
    end
  end

  context "Test Digits context" do
    it "should match string" do
      expect(2022).to eq(2022)
      puts("--Test Digits context--")
    end
  end

  after(:context) do
    puts("After context")
  end

  after(:all) do
    puts("After all")
  end
  after(:each) do
    puts("After each")
  end
end
