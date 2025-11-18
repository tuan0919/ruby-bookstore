# app/exceptions/application_exception.rb

class ApplicationException < StandardError
  attr_reader :error_code

  def initialize(error_definition)
    # Gửi message của ErrorDefinition lên StandardError
    super(error_definition.message)
    @error_code = error_definition
  end
end
