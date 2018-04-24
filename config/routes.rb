# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'social-media', to: 'pages#social_media'

  resources :blogs do
    member do
      post :toggle_status
    end
  end

  scope :blogs do
    get 'topic/:topic_id', to: 'blogs#topic', as: 'blogs_topic'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root to: 'pages#home'
end
