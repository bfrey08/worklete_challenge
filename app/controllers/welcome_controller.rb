class WelcomeController < ApplicationController
  def index
      redirect_to learner_quiz_path if session[:learner_id]
      redirect_to manager_quiz_path if session[:manager_id]
  end
end
