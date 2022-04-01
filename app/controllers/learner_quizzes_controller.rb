class LearnerQuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all.where(learner_id: params[:learner_id])
  end

  def show
  end

end
