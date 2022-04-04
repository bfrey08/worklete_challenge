class RemoveStatusFromQuizzes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :status, :string
  end
end
