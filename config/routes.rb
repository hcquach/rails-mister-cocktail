Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :new, :create, :show ] do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [ :destroy ]
  # delete "doses/:id", to: "doses#destroy", as: :delete_dose

  root to: 'cocktails#index'
end
