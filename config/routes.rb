Noah::Application.routes.draw do

  resource :noah

  resources :decks do
    resources :features do
      resources :blogs
    end
  end

  match 'noah/show' => 'noah#show', :via => :get
  match 'noah/login' => 'noah#login', :via => :get
  match 'noah/login' => 'noah#login_validate', :via => :post
  match 'noah/logout' => 'noah#logout', :via => :get
  match 'blogs/get_blog/:bid' => 'blogs#get_blog', :via => :get
  match 'gotosee/:bid' => 'noah#find_user', :via => :get

  # match 'noah' => 'noah#index', :via => :get
  # match 'deck/show' => 'deck#show', :via => :get
  # match 'deck/:id/feature/:fid' => 'deck#choose_feature', :via => :get
  # match 'deck/create_blog' => 'deck#create_blog', :via => :post
  # match 'deck/delete_blog/:bid' => 'deck#delete_blog', :via => :get
  # match 'deck/:id' => 'deck#show_default', :via => :get
  match 'fd' => 'noah#fake_data', :via => :get
  # match 'cfd' => 'noah#clean_fake_data', :via => :get

  root :controller => 'noah', :action => 'index'
end
