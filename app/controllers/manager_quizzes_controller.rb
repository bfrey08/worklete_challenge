class ManagerQuizzesController < ApplicationController
  def index
    @manager = Manager.find(params[:manager_id])
    @quizzes = Quiz.where(manager_id: @manager.id)
  end

  def show
  end
end
