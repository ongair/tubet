Rails.application.routes.draw do

  # Setup routes
  resources :leagues, only: [:create, :index]

  post '/teams/import' => 'teams#import'

end
