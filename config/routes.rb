Rails.application.routes.draw do
  root 'cocktails#index'
  # resources :doses do
    resources :cocktails do
      resources :doses , only: [ :new, :create , :destroy], shallow: true
    end

    # , only:  [ :new, :create ]
    resources :ingredients# , only: [ :new, :create ]
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
