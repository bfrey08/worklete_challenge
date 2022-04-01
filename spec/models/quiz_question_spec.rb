require 'rails_helper'


RSpec.describe QuizQuestion, type: :model do
  describe "relationships" do
    it {should belong_to :quiz}
    it {should belong_to :question}

  end
end
