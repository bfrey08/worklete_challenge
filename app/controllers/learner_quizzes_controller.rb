class LearnerQuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all.where(learner_id: params[:learner_id])
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    binding.pry

  end

end
