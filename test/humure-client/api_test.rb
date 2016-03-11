require 'test_helper'

class ApiTest < Minitest::Test
  def test_temperature
    stub_request(:get, "localhost:3001/api/temperature").with(headers: {"X-Sensor": "fake", "X-Token": "a-team"}).to_return(body: '{ "value": 26.5}')
    assert_equal 26.5, client.temperature
  end

  def test_humidity
    stub_request(:get, "localhost:3001/api/humidity").to_return(body: '{ "value": 53}')
    assert_equal 53, client.humidity
  end

  def test_lamp
    stub_request(:get, "localhost:3001/api/lamp").to_return(body: '{ "value": "off"}')
    assert_equal "off", client.lamp
  end

  def test_lamp_on
    stub_request(:put, "localhost:3001/api/lamp/on").with(headers: {"X-Sensor": "fake", "X-Token": "a-team"}).to_return(body: '{ "value": "on"}')
    assert_equal "on", client.switch_lamp_on
  end

  def test_lamp_off
    stub_request(:put, "localhost:3001/api/lamp/off").to_return(body: '{ "value": "off"}')
    assert_equal "off", client.switch_lamp_off
  end

  def test_change_lamp_color
    stub_request(:put, "localhost:3001/api/lamp/color/240/65/36").to_return(body: '{ "value": [240, 65, 36]}')
    assert_equal [240, 65, 36], client.change_lamp_color(240, 65, 36)
  end

  def client
    HumureClient.new(url: "http://localhost:3001",  token: "a-team")
  end
end
