require 'test_helper'

class HumureClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HumureClient::VERSION
  end

  def test_client_options
    client = ::HumureClient.new(url: "http://localhost:4001", token: "a-team")
    assert_equal "http://localhost:4001", client.url
    assert_equal "a-team", client.token
  end

  def test_token_option
    assert_raises ArgumentError do
      client = ::HumureClient.new()
    end
  end
end
