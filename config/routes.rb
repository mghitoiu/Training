# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams do
    get :download_logo, on: :member
    # post 'create_teams', action: :create_teams, :on => :collection
  end

  post 'create_teams', to: 'teams#create_teams'

  resources :managers, only: %i[index show create update]
end
