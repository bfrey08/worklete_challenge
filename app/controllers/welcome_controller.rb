class WelcomeController < ApplicationController
  def index
      redirect_to "/learners/#{session[:learner_id]}/quizzes" if session[:learner_id]
      redirect_to "/managers/#{session[:manager_id]}/quizzes" if session[:manager_id]
  end

  def show
  end

  def new
    if params[:role] == 'manager'
      manager = Manager.find_by(username: params[:username])
      if manager.password == params[:password]
        session[:manager_id] = manager.id
        redirect_to "/managers/#{manager.id}/quizzes"
      else
        redirect_to root
      end

    elsif params[:role] == 'learner'
      learner = Learner.find_by(username: params[:username])
      if learner.password == params[:password]
        session[:learner_id] = learner.id
        redirect_to "/learners/#{learner.id}/quizzes"
      else
        redirect_to root
      end
    else
    end
  end
end
