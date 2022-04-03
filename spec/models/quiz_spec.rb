require 'rails_helper'


RSpec.describe Quiz, type: :model do
  before(:each) do
    @learner = Learner.new(username: 'learner@test.com', password: 'testing')
    @learner.password = 'testing'
    @learner.save
    @manager = Manager.new(username: 'manager@test.com', password: 'testing')
    @manager.password = 'testing'
    @manager.save
    @quiz1 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id, status: 'unfinished')
    @quiz2 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id, status: 'unfinished')
    @question1 = Question.create(text: "Please press true", answer: "true")
    @question2 = Question.create(text: "Please press false", answer: "false")
    @question3 = Question.create(text: "Please do not press false", answer: "true")
    @question4 = Question.create(text: "Please do not press true", answer: "false")
    @quiz_questions1 = QuizQuestion.create(result: 'correct', question_id: @question1.id, quiz_id: @quiz1.id)
    @quiz_questions2 = QuizQuestion.create(result: 'correct', question_id: @question2.id, quiz_id: @quiz1.id)
    @quiz_questions3 = QuizQuestion.create(result: 'correct', question_id: @question3.id, quiz_id: @quiz1.id)
    @quiz_questions4 = QuizQuestion.create(result: 'unanswered', question_id: @question3.id, quiz_id: @quiz2.id)
    @quiz_questions5 = QuizQuestion.create(result: 'unanswered', question_id: @question4.id, quiz_id: @quiz2.id)
    @quiz_questions6 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz2.id)
  end
  describe "relationships" do
    it {should belong_to :learner}
    it {should belong_to :manager}
    it {should have_many :quiz_questions}
    it {should have_many(:questions).through(:quiz_questions)}

  it "can calculate the score of a quiz" do
    expect(@quiz1.score).to eq('100%')
  end

  end
end
