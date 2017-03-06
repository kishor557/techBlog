Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: "/admin", controllers: {sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords"}
  get 'welcome' => 'application#index'
  get 'about/:name' => "pages#about_me", as: "about_me"
  get 'contact/me' => "pages#contact"
  
  get "/login", to: redirect("/admin/sign_in")
  get "/admin", to: redirect("/admin/sign_in")
  
  resources :blogs, only: [:index, :show] do
    member do
     get 'update_like_or_dislike_count'
    end
    resources :comments
  end
  
  root to: "blogs#index"

  # Example resource route within a namespace:
   namespace :admin do
     # Directs /admin/products/* to Admin::ProductsController
     # (app/controllers/admin/products_controller.rb)
     resources :blogs do
       resources :comments, except: [:new, :create]
     end
     resources :dashboard, only: [:index]
   end
end
