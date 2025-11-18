# app/lib/error_codes.rb

class ErrorDefinition
  attr_reader :code, :message, :http_status

  def initialize(code:, message:, http_status:)
    @code = code
    @message = message
    @http_status = http_status
  end
end

module ErrorCodes
  # Định nghĩa cấu trúc lỗi: [code, message, http_status]

  # Lỗi Chung
  UNKNOWN_EXCEPTION     = ErrorDefinition.new(code: 9999, message: "Something went wrong :(.", http_status: :internal_server_error).freeze
  RESOURCE_NOT_FOUND    = ErrorDefinition.new(code: 1001, message: "Resource not found, please check again!", http_status: :not_found).freeze
  UNAUTHENTICATED       = ErrorDefinition.new(code: 1002, message: "You are not authenticated!", http_status: :unauthorized).freeze
  UNEXPECTED_BEHAVIOR   = ErrorDefinition.new(code: 1008, message: "Something went wrong, this action shouldn't perform", http_status: :bad_request).freeze

  # Lỗi Người dùng/Xác thực
  USER_NOT_EXISTED      = ErrorDefinition.new(code: 1003, message: "User is not existed!", http_status: :not_found).freeze
  USER_ALREADY_EXISTED  = ErrorDefinition.new(code: 1004, message: "User is already existed!", http_status: :bad_request).freeze
  JWT_EXPIRED           = ErrorDefinition.new(code: 1009, message: "Your session is out of date, please re-login", http_status: :forbidden).freeze

  # Lỗi Nghiệp vụ Book/Category
  CATEGORY_NOT_FOUND    = ErrorDefinition.new(code: 1011, message: "Category not found, please check again!", http_status: :not_found).freeze
  BOOK_NOT_FOUND        = ErrorDefinition.new(code: 1012, message: "Book not found, please check again!", http_status: :not_found).freeze
  ORDER_NOT_FOUND       = ErrorDefinition.new(code: 1012, message: "Order cannot be found", http_status: :not_found).freeze
  CANT_CANCEL_ORDER     = ErrorDefinition.new(code: 1010, message: "Only pending orders can be cancelled", http_status: :bad_request).freeze
end
