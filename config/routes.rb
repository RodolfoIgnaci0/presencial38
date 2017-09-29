Rails.application.routes.draw do
  resources :tareas, only: [:index, :show] do
    resources :accions, only: [:create, :destroy]
  end
  devise_for :users
  devise_scope :user do
    get 'sign_up', to: 'devise/sessions#registrations'
  end

  root to: 'tareas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
