Rails.application.routes.draw do
  #set the root to home page  
  root to: 'pages#home'
  #when about select, change to about page
  get 'about', to: 'pages#about'
  #shortcut for generating paths
  #provides various contact pages
  resources :contacts
end
