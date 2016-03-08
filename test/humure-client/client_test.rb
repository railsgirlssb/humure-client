require 'test_helper'

class HumureClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HumureClient::VERSION
  end

  def test_url_client_option
    client = ::HumureClient.new(url: "http://localhost:4001")
    assert_equal "http://localhost:4001",client.url
  end
end
