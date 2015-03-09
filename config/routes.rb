Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: { sessions: "admin/sessions", passwords: "admin/passwords" }
  namespace :admin do
    root 'dashboard#index'
    resources :admin_users
  end

  root 'admin/dashboard#index'
end
