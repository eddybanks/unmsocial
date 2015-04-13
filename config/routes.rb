Rails.application.routes.draw do

  root                  'static_pages#home'

  get 'about'       =>  'static_pages#about'

  get 'contact'     =>  'static_pages#contact'

  get 'events'      =>  'events#index'

  get 'calendar'    =>  'static_pages#calendar'

  get 'events/show'

  get 'events/new'

  get 'events/edit'

  get 'events/delete'

  post 'events/create'

  post 'events/update'

  post 'events/destroy'

  get 'groups'        =>  'groups#index'

  get 'groups/show'

  get 'groups/new'

  get 'groups/edit'

  get 'groups/delete'

  post 'groups/create'

  post 'groups/update'

  post 'groups/destroy'

end
