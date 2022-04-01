class WelcomeController < ApplicationController
  def index
      redirect_to learner_quiz_path if session[:learner_id]
      redirect_to manager_quiz_path if session[:manager_id]
  end

  def show
  end

  def new
    if params[:role] == 'manager'
      manager = Manager.find_by(username: params[:username])
      if manager.password == params[:password]
        session[:manager_id] = manager.id
        redirect_to "manager/#{manager.id}/quiz"
      else
        redirect_to root
      end

    elsif params[:role] == 'learner'
    else
    end
  end
end
