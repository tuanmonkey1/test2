Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  root 'staticpages#home'
end
# as :user do
#   get "signin" => "devise/sessions#new"
#   post "signin" => "devise/sessions#create"
#   delete "signout" => "devise/sessions#destroy"
# end