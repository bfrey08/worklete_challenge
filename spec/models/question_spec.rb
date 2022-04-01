 require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "relationships" do
    it {should have_many :quiz_questions}
    it {should have_many(:quizzes).through(:quiz_questions)}
  end
end
