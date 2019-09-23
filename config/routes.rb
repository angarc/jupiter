Rails.application.routes.draw do
  # default_url_options :host => "jupiter.agarciadev.com"
  default_url_options :host => "localhost:3000"

  devise_for :users, {
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      invitations: 'users/invitations'
    }
  }
  
  root 'dashboard#index'

  resources :projects do 
    get :completed_tasks

    resources :task_lists do 
      resources :tasks do 
        resources :comments, only: [:create, :update, :destroy]
        patch :toggle_complete
      end
    end
  end
end
