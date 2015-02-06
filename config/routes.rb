Blocmarks::Application.routes.draw do

 # get 'users_admin/' => 'users_admin#index'
 # get 'users_admin/show/:id' => 'users_admin#show'
 # get 'users_admin/edit/:id' => 'users_admin#edit'

 resources :users_admin

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    #devise_for :users, :controllers => {registrations: 'registrations'} 
    #  resources :users do
        resources :lists, only: [:show, :edit]
    #  end

      resources :lists, only: [:index, :show] do
          resources :items, only: [:create, :new]
      end
        resources :items, only: [:destroy]
    end
  end
  #get 'bookmark_category/destroy'
  resources :lists 

  resources :items #, only: [:new, :create, :update, :edit, :complete] 
  root 'home#index'
  
  resources :topics 
  get 'topics/index' => 'topics#index'
  get 'topics/show' => 'topics#show'
  get 'topics/new' => 'topics#new'
  get 'items/complete' => 'items#complete'
  
  devise_for :users, :controllers => {registrations: 'registrations'} do
  resources :bookmarks
  post :incoming, to: 'incoming#create'
  end
end

#    resources :item, only: [:create, :update] 
  #get 'lists/show' => 'lists#show'

 #  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
#  devise_for :users, :controllers => {sessions: 'sessions'}
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
