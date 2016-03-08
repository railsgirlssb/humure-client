class HumureClient

  attr_accessor :url

  # Initialize a new humure client
  # @param options [Hash]
  def initialize(options={})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    @url ||= "http://localhost:3000"
  end
end
