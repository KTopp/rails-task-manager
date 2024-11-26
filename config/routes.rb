Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "task#index"
  get "task/new", to: "task#new", as: :new_task
  get "task/:id", to: "task#show", as: :task
  get "task/:id/edit", to: "task#edit", as: :edit
  patch "task/:id", to: "task#update", as: :update
  delete "task/:id", to: "task#destroy", as: :delete
  post "task", to: "task#create", as: :tasks

end
