Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'

  resources :students #questo crea 6 differenti routes mappando il controller
  resources :professors do
    resources :arguments
  end
  resources :arguments
  resources :requests
  
  resources :sessions, only:[:new, :create, :destroy]
  resources :sessions_students, only:[:new, :create, :destroy]

  get 'signup_professor', to: 'professors#new', as: 'signup_professor'
  get 'signup_student', to: 'students#new', as: 'signup_student'
  get 'login_professor', to: 'sessions#new', as: 'login_professor'
  get 'logout_professor', to: 'sessions#destroy', as: 'logout_professor'
  get 'login_student', to: 'sessions_students#new', as: 'login_student'
  get 'logout_student', to: 'sessions_students#destroy', as: 'logout_student'


  get 'inserimento_tesi', to: 'arguments#new', as: 'inserimento_tesi'
  get 'mie_tesi', to: 'arguments#index', as: 'mie_tesi'
  get 'profilo_professore', to: 'professors#show', as: 'profilo_professore'
  get 'edit_professore', to: 'professors#edit', as: 'edit_professore'

  get 'profilo_studente', to: 'students#show', as: 'profilo_studente'
  get 'edit_studente', to: 'students#edit', as: 'edit_studente'

  get 'visualizza_tesi', to: 'arguments#show', as: 'visualizza_tesi'
  get 'edit_tesi', to: 'arguments#edit', as: 'edit_tesi'

  get 'nuova_richiesta', to: 'requests#new', as: 'nuova_richiesta'
  get 'visualizza_richieste', to: 'requests#show', as: 'visualizza_richieste'
  get 'accetta_richiesta', to: 'requests#edit', as: 'accetta_richiesta'

  get 'visualizza_tesisti', to: 'requests#index', as: 'visualizza_tesisti'


  #student GET    /students/:id(.:format)      students#show
  get 'students/:id' => 'students#show' #in alternativa---> get 'students/:id', to: 'students#show'
  get '/students(.:format)' => 'students#index'

  #get 'professors(.:format)' => 'professors#new'
  get 'professors/:id' => 'professors#show'

  get 'arguments/:id' => 'arguments#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'visualizza_info', to: 'welcome#show', as: 'visualizza_info'

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
