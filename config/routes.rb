InvolverTweets::Application.routes.draw do
  get "home/index"
  get "home/set"
  match 'home/set' => 'home#set'
  match 'home/index' => 'home#index'
  
  root :to => "home#index"
end
