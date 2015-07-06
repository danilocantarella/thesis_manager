Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'

  resources :students #questo crea 6 differenti routes mappando il controller
  resources :professors
  resources :arguments
  
  resources :sessions, only:[:new, :create, :destroy]
  resources :sessions_students, only:[:new, :create, :destroy]

  get 'signup_professor', to: 'professors#new', as: 'signup_professor'
  get 'signup_student', to: 'students#new', as: 'signup_student'
  get 'login_professor', to: 'sessions#new', as: 'login_professor'
  get 'logout_professor', to: 'sessions#destroy', as: 'logout_professor'
  get 'login_student', to: 'sessions_students#new', as: 'login_student'
  get 'logout_student', to: 'sessions_students#destroy', as: 'logout_student'

  get 'signup_thesi', to: 'thesis#new', as: 'signup_thesi'

  get 'thesis/:id' => 'thesis#show'
  get '/thesis(.:format)' => 'thesis#index'

  #student GET    /students/:id(.:format)      students#show
  get 'students/:id' => 'students#show' #in alternativa---> get 'students/:id', to: 'students#show'
  get '/students(.:format)' => 'students#index'

  #get 'professors(.:format)' => 'professors#new'
  get 'professors/:id' => 'professors#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  #controller :sessions do
  #  get    'login'   => :new
  #  post   'login'   => :create
  #  delete 'logout'  => :destroy
  #end



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
