require 'net/http'
require 'json'

class HumureClient

  def humidity
    get_request("humidity")
  end

  def temperature
    get_request("temperature")
  end

  def lamp
    get_request("lamp")
  end

  protected

  def get_request(path)
    resp = Net::HTTP.get_response(uri(path))

    if resp.code != '200'
      return nil
    end

    v = JSON.parse(resp.body)
    return v["value"]
  rescue SocketError
    nil
  end

  def uri(path)
    URI(url + "/api/" + path)
  end

end
