require 'selenium-webdriver'

RSpec.describe 'Ecommerce Tests' do
  before(:context) do
    # @driver = Selenium::WebDriver.for(:firefox)

    username = "{LT_USERNAME}"
    accessToken = "{LT_ACCESS_KEY}"
    gridUrl = "hub.lambdatest.com/wd/hub"

    capabilities = {
      'LT:Options' => {
        "user" => username,
        "accessKey" => accessToken,
        "build" => "RSpec Ecommerce Test",
        "name" => "RSpec Ecommerce Tests",
        "platformName" => "Windows 11"
      },
      "browserName" => "Firefox",
      "browserVersion" => "100.0",
    }

    @driver = Selenium::WebDriver.for(:remote,
                                      :url => "https://" + username + ":" + accessToken + "@" + gridUrl,
                                      :desired_capabilities => capabilities)

    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @url = "https://ecommerce-playground.lambdatest.io/"
    @driver.get(@url)
  end

  context "Test that the title matches Your Store" do
    it "should have a home page" do
      expect(@driver.title).to eq("Your Store")
    end
  end

  context "Search for a product" do
    it "should search for a phone" do

      search_box = @driver.find_element(:name, "search")

      search_box.clear
      search_box.send_keys("phone")
      search_box.submit
      sleep(5)

      search_title = @driver.find_element(:xpath, '//*[@id="entry_212456"]/h1')
      expect(search_title.text).to eq("Search - phone")
    end
  end

  after(:context) do
    @driver.quit
  end
end
