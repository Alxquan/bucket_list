Rails.application.routes.draw do

  root 'buckets#index'
  resources :buckets do
    resources :tasks
  end


end
