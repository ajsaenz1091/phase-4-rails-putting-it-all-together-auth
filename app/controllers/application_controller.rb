class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_not_found_response 
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  
  def render_not_found_response(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end


end
