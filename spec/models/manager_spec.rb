require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe "relationships" do
    it {should have_many :quizzes}
  end
end
