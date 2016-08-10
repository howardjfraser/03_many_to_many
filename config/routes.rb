Rails.application.routes.draw do
  root 'notes#about'

  get 'notes/about'

  resources :people
  resources :mailing_lists
end
