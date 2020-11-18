Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :dogs do
    resources :bookings, only: [:new, :create, :show, :edit, :update] # edit/update only on status ?
  end
  resources :bookings, only:[:destroy,:index]
  # put destroy outside of nested loop -> because ends up being dogs/dog_id/bookings/:id and not /bookings/:id

  # delete user but also dog destroy should be only by user id stored to dog ?
  # resources :users, only: :destroy ## If user id == dog.user_id THEN allow delete ?

end
