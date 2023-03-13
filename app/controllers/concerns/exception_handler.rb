module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  end

  private

  def render_not_found(exception)
    json_response({ error: exception.message }, status: :not_found)
  end

  def render_unprocessable_entity(exception)
    json_response({ error: exception.message }, status: :unprocessable_entity)
  end
end
