module Api
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      render json: @resource, context: self
    end
  end
end
