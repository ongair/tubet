Rails.application.routes.draw do

  # Setup routes
  resources :leagues, only: [:create, :index]
  resources :messages, only: [:create]

  post '/teams/import' => 'teams#import'  

end
