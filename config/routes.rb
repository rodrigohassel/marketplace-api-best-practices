# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api,
            defaults: { format: :json },
            constraints: { subdomain: 'api' },
            path: '/' do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: %i[show create update destroy]
      resources :products, only: %i[show]
      resources :sessions, only: %i[create destroy]
    end
  end
end
