Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "students", to: "students#create", as: "students_create"
  delete 'students/:id', to: "students#destroy", as: "students_destroy"
  get 'schools/:school_id/classes', to: "classes#index", as: "classes_index"
  get 'schools/:school_id/classes/:class_id/students', to: "classes#show", as: "classes_show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
