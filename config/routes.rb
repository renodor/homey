# frozen_string_literal:true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'projects#index'

  resources :projects, only: %i[index show] do
    resources :comments, only: :create
  end
end
