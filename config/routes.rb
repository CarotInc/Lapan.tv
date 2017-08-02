Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/' => 'posts#create'
  get '/:id' => 'posts#show'
  get 'search/product' => 'posts#search'
  get 'tag/search' => 'posts#tag'
  get 'tag/:tag' => 'posts#tag'
  get '/posts/topic/new' => 'topic#new'
  get '/:id/topic' => 'posts#topicshow'
  post '/' => 'topic#create'
  get ':id/category' => 'posts#cateShow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
