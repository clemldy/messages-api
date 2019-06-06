module Api
  class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
    def render_validate_token_success
      render json: @resource, context: self
    end
  end
end
