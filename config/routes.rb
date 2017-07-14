Rails.application.routes.draw do
  # set the root to home page  
  root to: 'pages#home'
  # when devise creates a user, we devise it know which type of user it is
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do 
    resource :profile
  end  
  # when about select, change to about page
  get 'about', to: 'pages#about'
  # shortcut for generating paths
  # provides various contact pages
  # limit user routes to :create
  resources :contacts, only: :create
  # points custom url to contacts/new
  # contact_us will change to new_contact us path
  get 'contact-us', to: 'contacts#new', as: "new_contact"
end
