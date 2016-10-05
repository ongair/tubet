Rails.application.routes.draw do

  # Setup routes
  resources :leagues, only: [:create, :index]
  resources :messages, only: [:create]
  resources :contacts, only: [:index]

  post '/teams/import' => 'teams#import'

end
