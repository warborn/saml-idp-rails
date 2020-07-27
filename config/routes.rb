Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/saml/auth' => 'saml_idp#new'
  get '/saml/metadata' => 'saml_idp#show'
  post '/saml/auth' => 'saml_idp#create'
  match '/saml/logout' => 'saml_idp#logout', via: %i[get post delete]
end
