Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/' => 'posts#create'
  get '/:id/lapan/' => 'posts#show'
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
  get '/inquiry' => 'inquiry#index'
  get '/inquiry/confirm' => redirect("/inquiry")
  get '/inquiry/thanks' => redirect("/inquiry")
  ##### 問い合わせ確認画面
  post '/inquiry/confirm' => 'inquiry#confirm'
  ##### 問い合わせ完了画面
  post '/inquiry/thanks' => 'inquiry#thanks'
end
