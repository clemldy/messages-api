module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_api_user

    def connect
      self.current_api_user = find_verified_api_user
    end

    protected

    def find_verified_api_user
      if verified_api_user = env['warden'].user
        verified_api_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
