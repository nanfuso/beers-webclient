Rails.application.routes.draw do
  get '/' => 'beers#index'
  get '/beers' => 'beers#index'
  get '/beers/new' => 'beers#new'
  post '/beers' => 'beers#create'
  get '/beers/:id' => 'beers#show'

end
