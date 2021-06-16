Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "homes#index"
  resources :contacts, only: %i[index creae]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
