require 'rails_helper'

RSpec.describe Learner, type: :model do
  describe "relationships" do
    it {should have_many :quizzes}
  end
end
