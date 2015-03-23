Blocmarks::Application.routes.draw do

 # get 'addresses/destroy'
 # get 'users_admin/' => 'users_admin#index'
 # get 'users_admin/show/:id' => 'users_admin#show'
 # get 'users_admin/edit/:id' => 'users_admin#edit'

 #resources :users_admin

 #devise_for :users, :controllers => {registrations: 'registrations'} 
  devise_for :users
    resources :users, only: [:update, :show, :index] 
    resources :topics  do
      resources :posts, except: [:index], controller: 'topics/posts' 
    end

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :update,  :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  root 'home#index'
  get 'about' => 'welcome#about'

resources :contacts do
  resources :addresses
  resources :contact_emails
  resources :contact_comments
  resources :orders do
    resources :order_products
  end
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
