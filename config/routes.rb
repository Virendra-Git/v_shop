# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboards/index'
  get 'dashboard/create'
  get 'dashboard/update'
  get 'dashboard/destroy'
  resources :users
  root 'users#new'
  post "/users/login", to: "users#login"
end
