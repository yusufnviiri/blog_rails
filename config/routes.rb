Rails.application.routes.draw do
  root "authors#index"
  get 'posts/index'
  get "pages/home"
  post '/authors/:author_id/posts/:post_id/like', to: 'posts#like', as: 'like'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :authors do
    resources :posts do
      resources :comments
    end
  end
end
