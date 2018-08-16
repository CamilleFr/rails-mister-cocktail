Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coctktails do
    resources :doses, only [:create, :new ]
end
