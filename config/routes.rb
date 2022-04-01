Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'welcome#show'
  post '/login', to: 'welcome#new'

  get 'manager/:manager_id/quiz', to: 'manager_quizzes#controller'
  get 'learner/:learner_id/quiz', to: 'learner_quizzes#controller'
end
