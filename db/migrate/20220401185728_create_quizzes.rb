class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :learner, foreign_key: true
      t.references :manager, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
