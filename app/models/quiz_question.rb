class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  belongs_to :question

  def self.find_by_references(quiz_id, question_id)
    where("quiz_id = ? AND question_id = ?", quiz_id, question_id).first

  end

end
