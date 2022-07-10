Rails.application.routes.draw do

  # create memberships
  resources :memberships, only:[:create, :index]

  # show route/includes all memberships for that client
  # create index/update
  resources :clients, only:[:index, :create, :show, :update]

  # view one specific gym/delete gym
  # create index/update
  resources :gyms

end
