Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/' => 'posts#create'
  get '/:id' => 'posts#show'
  get 'search/product' => 'posts#search'
  get 'tag/search' => 'posts#tag'
  get 'tag/:tag' => 'posts#tag'
  get '/posts/topic/new' => 'topics#new'
  get '/:id/topic' => 'posts#topicshow'
  post '/topics' => 'topics#create'
  get ':id/category' => 'posts#cateShow'
  get '/for/you' => 'posts#foryou'
  get '/topic/all' => 'topics#index'
  get 'more/pickup' => 'posts#pickup'
  get '/posts/newposts' => 'posts#newposts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
