Rails.application.routes.draw do

  root                  'static_pages#home'

  resources :events
  
  get 'users'      =>   'users#index'

  get 'users/show'

  get 'new_users'   =>  'users#new'

  get 'users/delete'

  get 'user_edit'   =>  'users#edit'

  post 'users/create'

  get 'users/create'

  post 'users/update'

  post 'users/destroy'

  get 'c_events_users' => 'events#c_events_users'

  get 'about'       =>  'static_pages#about'

  get 'events'      =>  'events#index'

  get 'calendar'    =>  'static_pages#calendar'

  get 'contacts'     =>  'contacts#new'

  get 'events_cal'  =>  'events#calendar_events'


  get 'groups'        =>  'groups#index'

  get 'groups/show'

  get 'groups/new'

  get 'groups/edit'

  get 'groups/delete'

  post 'groups/create'

  post 'groups/update'

  post 'groups/destroy'

  post 'contacts/create' => 'contacts#create'

  get 'comments'    =>  'faqcomments#index'

  get 'admin'       => 'admin#index'

  get 'logout'      => 'application#logout'

end
