Rails.application.routes.draw do
  resources :tareas, only: [:index, :show] do
    resources :accions, only: [:create, :update]
  end
  devise_for :users

  root to: 'tareas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
