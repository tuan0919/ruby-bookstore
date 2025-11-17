class AppResponse
  attr_accessor :code, :message, :result

  def initialize(code: 1000, message: nil, result: nil)
    @code = code
    @message = message
    @result = result
  end

  def as_json(_options = {})
    {
      code: code,
      message: message,
      result: result
    }.compact
  end
end