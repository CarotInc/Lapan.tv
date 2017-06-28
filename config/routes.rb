Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/' => 'posts#create'
  get '/:id/fashion/diy' => 'posts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
