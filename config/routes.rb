Rails.application.routes.draw do
  namespace :trackers do
    resources :events
  end
  root 'employees#employee_sign_in'
  match "employees/sign_in" => "employees#employee_sign_in", :as => "employee_sign_in", via: [:post, :get]
  match "employees/logout" => "employees#employee_logout", :as => "logout_employee", via: [:post, :get]
  match "employees/login" => "employees#employee_login", :via => [:post]
  match "admin/:filter" => "employees#filter", :via => [:get]
  resources :categories
  namespace :users do
    resources :visits
  end
  namespace :stores do
    resources :reviews
  end
  resources :stores
  resources :users
  resources :employees
  match 'tracker' => 'trackers#test_method', via: [:put, :post]
  resources :trackers
  match 'api/signup' => 'api#signup', via: [:put,:post]
  match 'api/login' => 'api#login', via: [:put,:get,:post]
  match 'api/categories' => 'api#categories', via: [:get]
  match 'api/categories' => 'api#new_categories', via: [:put,:post]
  match 'api/stores' => 'api#stores', via: [:get]
  match 'api/stores' => 'api#new_store', via: [:put,:post]
  match 'api/reviews' => 'api#review', via: [:put,:post]
  match 'api/store/:id' => 'api#store', via: [:get]
  match 'api/visit' => 'api#store_status', via: [:put,:post]
  match 'api/visits' => 'api#visits', via: [:put,:post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
