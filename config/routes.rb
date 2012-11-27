Noah::Application.routes.draw do
  #get "deck/show"

  resource :deck do
    resource :feature do
      resource :blog
    end
  end

  match 'noah' => 'noah#index', :via => :get
  match 'deck/show/:id' => 'deck#show', :via => :get
  match 'fd' => 'noah#fake_data', :via => :get
  match 'cfd' => 'noah#clean_fake_data', :via => :get

  root :controller => 'noah', :action => 'index'
end
