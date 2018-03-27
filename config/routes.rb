Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users

  # Root directed to Home page
  root to: 'pages#home'

  # Static pages : landing, how-it-works, about etc.
  get "home", to: 'pages#landing_liquidity'
  get "about", to: 'pages#about_us'
  get "how-it-works", to: 'pages#how_it_works'
  get "thank-you", to: 'pages#thank_you'

  # Static admin section to set admin cookie to exclude internal traffic
  get "set_admin_cookie", to: 'pages#set_admin_cookie'

  # Property form funnel routes
  resources :property_forms, only: [:show, :new, :create, :update, :destroy]

  # Request CRUD
  resources :requests, only: [:new, :create]

  get "seller/:token/address", to: "property_forms#a_address_validation", as: :form_step_1
  get "seller/:token/property_type", to: "property_forms#b_property_type_selection", as: :form_step_2
  put "seller/:token/description_1", to: "property_forms#c_description_1", as: :form_step_3
  get "seller/:token/description_2", to: "property_forms#d_description_2", as: :form_step_4
  get "seller/:token/description_3", to: "property_forms#e_description_3", as: :form_step_5
  get "seller/:token/photos", to: "property_forms#f_add_images", as: :form_step_6
  get "seller/:token/personnal_information", to: "property_forms#g_personnal_information", as: :form_step_7
  get "seller/:token/confirmation", to: "property_forms#h_confirmation", as: :form_step_8
  get "seller/:token/validation", to: "property_forms#i_validation", as: :form_step_9

  # Static admin section to set admin cookie to exclude internal traffic
  get "faqs", to: "faqs#index"

  # Property image routes to create or delete an image
  resources :property_images, only: [:create]

  # RealEstateProperties routes
  resources :real_estate_properties, only: [:index, :show]

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
