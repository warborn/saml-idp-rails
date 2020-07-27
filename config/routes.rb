Rails.application.routes.draw do
  devise_for :users

  get '/saml/auth' => 'saml_idp#create'
  post '/saml/auth' => 'saml_idp#create'
  get '/saml/metadata' => 'saml_idp#show'
  post '/saml/auth' => 'saml_idp#create'
  match '/saml/logout' => 'saml_idp#logout', via: %i[get post delete]

  root 'home#index'
  get 'home' => 'home#index'
end
