Rails.application.routes.draw do

  get 'book/index'

  get 'book/new'

  get 'book/create'

  get 'book/add'

  get 'book/show'

  get 'book/update'

  get 'book/destroy'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
