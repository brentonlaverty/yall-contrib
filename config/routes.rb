Rails.application.routes.draw do

  root 'prompts#index'

  resources :prompts, shallow: true do
  	  resources :contribs
  end

  get '/dashboard', to: 'prompts#index'

  get '/frontpage', to: 'frontpage#index'

  get 'users/show'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end  

  get '/user/:username', to: 'users#show', as: 'username'

  match 'contrib/:id/publish' => 'contribs#publish_contrib', via: [:patch, :put], as: :publish_contrib

  match 'contrib/:id/unpublish' => 'contribs#unpublish_contrib', via: [:patch, :put], as: :unpublish_contrib

end
