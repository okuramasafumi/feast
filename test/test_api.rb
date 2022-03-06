# frozen_string_literal: true

require 'test_helper'
require 'feast/api'

class TestAPI < Minitest::Test
  include Rack::Test::Methods

  def app
    api = Feast::API.new
    app = api.get('/') do
      { message: 'Hello World' }.to_json
    end
    builder = Rack::Builder.new
    builder.run(app)
  end

  def test_response_is_ok
    get('/')

    assert(last_response.ok?)
    assert_equal('{"message":"Hello World"}', last_response.body)
  end
end
