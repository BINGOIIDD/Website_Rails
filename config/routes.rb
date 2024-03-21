Rails.application.routes.draw do
  get 'admin_place/main'
  get 'admin_place/users'
  get 'admin_place/products'
  get 'admin_place/reviews'
  get 'admin_place/categories'
  get 'admin_place/test_question_list'
  get 'admin_place/tests'
  get 'test_questions/new'
  get 'test_results/index'
  get 'test_results/new'
  get 'test_lists/index'
  get 'test_lists/show'
  get 'test_lists/new'
  get 'test_lists/edit'
  get 'users/index_product'
  get 'users/index_review'
  get 'users/index_test'
  get 'users/show'
  get 'users/edit'
  
  
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users

  root "products#index"

  resources :products do 
    resources :reviews
  end

  resources :test_lists

  resources :test_questions

  resources :test_results

  resources :categories

  resources :admin_place
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
