Noah::Application.routes.draw do

  resource :noah

  resources :decks do
    resources :features do
      resources :blogs
    end
  end

  match 'blogs/get_blog/:bid' => 'blogs#get_blog', :via => :get

  # match 'noah' => 'noah#index', :via => :get
  # match 'deck/show' => 'deck#show', :via => :get
  # match 'deck/:id/feature/:fid' => 'deck#choose_feature', :via => :get
  # match 'deck/create_blog' => 'deck#create_blog', :via => :post
  # match 'deck/delete_blog/:bid' => 'deck#delete_blog', :via => :get
  # match 'deck/:id' => 'deck#show_default', :via => :get
  # match 'fd' => 'noah#fake_data', :via => :get
  # match 'cfd' => 'noah#clean_fake_data', :via => :get

  root :controller => 'noah', :action => 'show'
end
