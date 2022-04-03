class Quiz < ApplicationRecord
  belongs_to :learner
  belongs_to :manager
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions


  def score
    correct = quiz_questions.where(result: "correct")
    incorrect = quiz_questions.where(result: "incorrect")

    percent = (correct.count.to_f / (correct.count.to_f + incorrect.count.to_f)) * 100
    "#{percent.round}%"
  end
end
