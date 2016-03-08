require 'test_helper'

class HumureClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HumureClient::VERSION
  end
end
