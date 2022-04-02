class LearnerQuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all.where(learner_id: params[:learner_id])
  end

  def show

    @quiz = Quiz.find(params[:quiz_id])
    @quiz_questions = @quiz.quiz_questions.where(result: "unanswered")
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.find(params[:quiz_question_id])
    @question = @quiz_question.question
    if @question.answer == params[:learner_answer]
      QuizQuestion.update(@quiz_question.id, result: "correct")
    else
      QuizQuestion.update(@quiz_question.id, result: "incorrect")
    end

    redirect_to "/learners/#{params[:learner_id]}/quizzes/#{@quiz.id}"
  end

end
