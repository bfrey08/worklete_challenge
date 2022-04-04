class Quiz < ApplicationRecord
  belongs_to :learner
  belongs_to :manager
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions


  def score
    correct = quiz_questions.where(result: "correct")
    incorrect = quiz_questions.where(result: "incorrect")
    if correct.count > 0
      percent = (correct.count.to_f / (correct.count.to_f + incorrect.count.to_f)) * 100
    else
      percent = 0
    end
    "#{percent.round}%"
  end

  def status
    if quiz_questions.where(result: "unanswered").count == 0
      "complete"
    elsif quiz_questions.where(result: "correct").count > 0 || quiz_questions.where(result: "incorrect").count > 0 && quiz_questions.where(result: "unanswered").count > 0
      "incomplete"
    else
      "not started"
    end
  end
end
