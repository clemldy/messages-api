Rails.application.routes.draw do
  concern :api_base do |options|
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions:  "#{options[:namespace]}/sessions",
        registrations:  "#{options[:namespace]}/registrations",
        token_validations:  "#{options[:namespace]}/token_validations"
      }
    resources :rooms, only: [ :index, :show ]
  end
  mount ActionCable.server => '/cable'

  namespace :api, defaults: { format: :json } do
    concerns :api_base, namespace: "api"
  end

end
