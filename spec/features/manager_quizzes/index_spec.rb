require 'rails_helper'


describe 'ManagerQuizzes index page' do
  before(:each) do
    @learner = Learner.new(username: 'learner@test.com', password: 'testing')
    @learner.password = 'testing'
    @learner.save
    @manager = Manager.new(username: 'manager@test.com', password: 'testing')
    @manager.password = 'testing'
    @manager.save


    @quiz1 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id)
    @quiz2 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id)
    @quiz3 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id)
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
    @quiz_questions7 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz3.id)
    @quiz_questions8 = QuizQuestion.create(result: 'correct', question_id: @question2.id, quiz_id: @quiz3.id)
    @quiz_questions9 = QuizQuestion.create(result: 'correct', question_id: @question3.id, quiz_id: @quiz3.id)

    visit '/'
    expect(page).to have_button('Manager Login')
    click_button 'Manager Login'
    expect(page).to have_content("Log In to Your Account")
    fill_in :username, with: 'manager@test.com'
    fill_in :password, with: 'testing'

    click_button 'Log In'

    expect(current_path).to eq("/managers/#{@manager.id}/quizzes")

  end
  it 'can show the learners that have quizzes with a manager' do
    expect(page).to have_content("learner@test.com")
  end
  it 'can show the correct status of a quiz' do
    expect(page).to have_content("complete")
    expect(page).to have_content("not started")
    expect(page).to have_content("incomplete")
  end


end
