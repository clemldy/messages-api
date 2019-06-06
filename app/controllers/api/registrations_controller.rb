module Api
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    # skip_before_action :verify_authenticity_token, :only => :create
    def render_create_success
      render json: @resource, context: self
    end
  end
end
