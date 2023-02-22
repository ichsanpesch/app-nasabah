Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'

  # resources :users, only: [:new, :create]   
  # get 'login', to: 'sessions#new'   
  # post 'login', to: 'sessions#create'   
  get '', to: 'sessions#welcome'
  # get 'authorized', to: 'sessions#page_requires_login'

  get 'login', to: 'nasabah#Login'
  post 'login', to: 'nasabah#ApiLogin'

  get 'register', to: 'nasabah#Register'
  post 'register', to: 'nasabah#ApiRegister'

  get 'api-get-nasabah', to: 'api_nasabah#GetData'
  get 'api-get-nasabah-by-id', to: 'api_nasabah#GetDataById'
  post 'api-insert-nasabah', to: 'api_nasabah#InsertData'
  put 'api-update-nasabah', to: 'api_nasabah#UpdateData'
  delete 'api-delete-nasabah', to: 'api_nasabah#DeleteDataById'
  
  post 'api-login-nasabah', to: 'api_nasabah#LoginByEmailPassword'


  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
