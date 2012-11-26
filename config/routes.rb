Noah::Application.routes.draw do
  match 'noah' => 'noah#index', :via => :get
  match 'fd' => 'noah#fake_data', :via => :get
  match 'cfd' => 'noah#clean_fake_data', :via => :get
end
