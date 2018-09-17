Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages
  root to: "pages#index"
end
