# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: :registration
  root to: 'books#index'
  resources :books, only: %i[index show]
  resources :categories, only: %i[index show]
end
