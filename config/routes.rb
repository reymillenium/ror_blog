Rails.application.routes.draw do

  # Changing the default main page to the posts' index view
  # get '/', to: 'posts#index'
  # root 'posts#index'

  # Example if I need to restrict a resource and/o add a non typical view (like the 'transfer' view)
  # resources :patients, only: [:index] do
  #   get 'transfer'
  # end

  # Includes the Posts CRUD (Create, Render, Update & Delete):
  resources :posts

  # The about view (extra)
  get 'about', to: 'about#show'

end
