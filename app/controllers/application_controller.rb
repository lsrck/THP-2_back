class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(error)
    render json: { errors: [{ detail: error.message }] }, status: :not_found
  end
end
