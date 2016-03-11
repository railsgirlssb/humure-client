class HumureClient

  attr_accessor :url,
                :token,
                :sensor

  # Initialize a new humure client
  # @param options [Hash]
  def initialize(options={})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    raise ArgumentError.new("Option :token missing") if token.nil?

    @url ||= "http://localhost:3000"
    @sensor ||= "fake"
  end
end
