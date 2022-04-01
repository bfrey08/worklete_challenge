Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'welcome#show'
  post '/login', to: 'welcome#new'

  get 'managers/:manager_id/quizzes', to: 'manager_quizzes#index'
  get 'learners/:learner_id/quizzes', to: 'learner_quizzes#index'
end
