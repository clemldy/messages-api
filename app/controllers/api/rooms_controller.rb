module Api
  class RoomsController < BaseController
   before_action :authenticate_api_user!

    def index
      @rooms = current_api_user.rooms
      render :index
    end

    def create
      if Room.between(params[:sender_id],params[:recipient_id]).present?
        @room = Room.between(params[:sender_id], params[:recipient_id]).first
      else
        @room = Room.create!(room_params)
      end
      render :show
    end

    def show
      @room = current_api_user.rooms.find(params[:id]).includes(:messages)
      render :show
    end

    private

    def room_params
      params.permit(:sender_id, :recipient_id)
    end

  end
end
