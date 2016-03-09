require 'test_helper'

class ApiTest < Minitest::Test
  def test_temperature
    stub_request(:get, "localhost:3001/api/temperature").to_return(body: '{ "value": 26.5}')
    assert_equal 26.5, HumureClient.new(url: "http://localhost:3001").temperature
  end

  def test_humidity
    stub_request(:get, "localhost:3001/api/humidity").to_return(body: '{ "value": 53}')
    assert_equal 53, HumureClient.new(url: "http://localhost:3001").humidity
  end

  def test_lamp
    stub_request(:get, "localhost:3001/api/lamp").to_return(body: '{ "value": "off"}')
    assert_equal "off", HumureClient.new(url: "http://localhost:3001").lamp
  end
end
