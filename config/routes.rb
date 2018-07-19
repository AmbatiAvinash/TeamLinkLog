Rails.application.routes.draw do
  root :to => "links#index"
  resources :links
  get 'tags/:tag', to: 'links#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
