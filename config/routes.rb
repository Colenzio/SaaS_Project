Rails.application.routes.draw do
  #set the root to home page  
  root to: 'pages#home'
  #when about select, change to about page
  get 'about', to: 'pages#about'
  #shortcut for generating paths
  #provides various contact pages
  resources :contacts
  #points custom url to contacts/new
  get 'contact-us', to: 'contacts#new'
end
