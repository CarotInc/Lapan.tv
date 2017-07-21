Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/' => 'posts#create'
  get '/:id/fashion/diy' => 'posts#show'
  get 'search/product' => 'posts#search'
  get 'tag/search' => 'posts#tag'
  get 'tag/:tag' => 'posts#tag'
  get '/posts/topic/new' => 'posts#newtopic'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
