require 'rails_helper'


RSpec.describe Quiz, type: :model do
  describe "relationships" do
    it {should belong_to :learner}
    it {should belong_to :manager}
    it {should have_many :quiz_questions}
    it {should have_many(:questions).through(:quiz_questions)}


  end
end
