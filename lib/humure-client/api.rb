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

  def switch_lamp_on
    put_request("lamp/on")
  end

  def switch_lamp_off
    put_request("lamp/off")
  end

  def change_lamp_color(red, green, blue)
    put_request("lamp/color/#{red}/#{green}/#{blue}")
  end

  protected

  def get_request(path)
    resp = Net::HTTP.get_response(uri(path))
    process_response(resp)
  rescue SocketError
    nil
  end

  def put_request(path)
    http = Net::HTTP.new(uri(path).host, uri(path).port)
    request = Net::HTTP::Put.new(uri(path).path)
    request.set_form_data({})

    resp = http.request(request)
    process_response(resp)
  rescue SocketError
    nil
  end

  def uri(path)
    URI(url + "/api/" + path)
  end

  def process_response(resp)
    return nil if resp.code != '200'

    v = JSON.parse(resp.body)
    v["value"]
  end

end
