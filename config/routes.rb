Rails.application.routes.draw do
  
  devise_for :users, {
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      invitations: 'users/invitations'
    }
  }
  
  root 'dashboard#index'

  resources :projects
end
