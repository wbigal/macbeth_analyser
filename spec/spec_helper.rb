require 'webmock/rspec'

Dir[File.dirname(__FILE__) + "/../app/**/*.rb"].each { |file| require_relative file }

RSpec.configure do |config|

  config.before(:each) do
    stub_request(:get, "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml").
           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => File.new('./spec/fixtures/macbeth.xml').read, :headers => {})
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
