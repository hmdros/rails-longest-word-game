Rails.application.routes.draw do
  get '/new', to: 'games#new'
  get '/score', to: 'games#score'
  post '/score', to: 'games#score'
  get '/pontuation', to: 'games#pontuation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
