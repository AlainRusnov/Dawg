Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :dogs do
    resources :bookings, only: [:new, :create, :show, :index, :edit, :update] # edit/update only on status ?
  end
  resources :bookings, only: :destroy
  # put destroy outside of nested loop -> because ends up being dogs/dog_id/bookings/:id and not /bookings/:id

  resources :users, only: :destroy

end
