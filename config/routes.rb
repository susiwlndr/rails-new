Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "home#index"
  root "home#index"
  root "forum_threads#index"

  resources :forum_threads, only: [:show, :new, :create, :edit, :update] do 
  	resources :forum_posts, only: [:create]
	end
end
