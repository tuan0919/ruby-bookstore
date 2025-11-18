require_relative "../exceptions/application_exception"
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  rescue_from ApplicationException, with: :handle_application_exception

  private
  def handle_application_exception(exception)
    error_code = exception.error_code
    render json: AppResponse.new(
      code: error_code.code,
      message: exception.message
    ), status: error_code.http_status
  end
end
