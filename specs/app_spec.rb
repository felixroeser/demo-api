ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'
require "rack/test"
require "minitest/autorun"

describe 'Api' do
  include Rack::Test::Methods

  before do
  end

  def app
    API
  end

  describe "products" do

    describe "GET /" do

      it "returns all products" do
        get "/v1/products"
        assert last_response.ok?
        assert JSON.parse(last_response.body).size == 4
      end

    end

    describe "GET /:id" do
      # skip "test this later"
    end

  end

end
