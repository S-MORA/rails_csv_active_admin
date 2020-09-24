Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'download', to: 'admin/dashboard#download'
  post 'upload_csv', to: 'admin/dashboard#upload_csv'
  get 'show_csv', to: 'admin/dashboard#show_csv'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
