# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/companies/companies_options', to: 'companies#options_select'
  resources :jobs, only: %i[show index create update destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
