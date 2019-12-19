Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails do
    resources :doses, only: [:index, :new, :create, :destroy]
    resources :reviews, only: [:index, :new, :create]
  end

end
