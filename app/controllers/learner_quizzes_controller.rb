class LearnerQuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all.where(learner_id: params[:learner_id])
  end

  def show

    @quiz = Quiz.find(params[:quiz_id])
    @quiz_questions = @quiz.quiz_questions.where(result: "unanswered")
    if @quiz_questions.count == 0
      redirect_to "/learners/#{params[:learner_id]}/quizzes"
      flash[:notice] = "Your score was #{@quiz.score}"
    end
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.find(params[:quiz_question_id])
    @question = @quiz_question.question

    if @question.answer == params[:learner_answer]
      QuizQuestion.update(@quiz_question.id, result: "correct")
      flash[:notice] = 'You got the question correct!'
    else
      QuizQuestion.update(@quiz_question.id, result: "incorrect")
      flash[:error] = 'You got the question incorrect'

    end

    if @quiz.status == "complete"

      ActionCable.server.broadcast(
        "manager_learner_id=#{@quiz.learner_id}; manager_id=#{@quiz.manager_id}_quiz_channel",
        msg: "Learner: #{@quiz.learner.id} just completed quiz: #{@quiz.id} with a score of: #{@quiz.score}"

      )
    end 

    redirect_to "/learners/#{params[:learner_id]}/quizzes/#{@quiz.id}"
  end

end
