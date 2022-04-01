class Quiz < ApplicationRecord
  belongs_to :learner
  belongs_to :manager
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
end
