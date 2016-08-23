Rails.application.routes.draw do

  root 'buckets#index'
  resources :buckets


end
