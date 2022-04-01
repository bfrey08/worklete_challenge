require 'rails_helper'


describe 'LearnerQuizzes index page' do
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
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz1.id)
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question2.id, quiz_id: @quiz1.id)
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question3.id, quiz_id: @quiz1.id)
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question3.id, quiz_id: @quiz2.id)
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question4.id, quiz_id: @quiz2.id)
    @quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz2.id)
    visit '/'
    expect(page).to have_button('Learner Login')
    click_button 'Learner Login'
    expect(current_path).to eq("/login")

    expect(page).to have_content("Log In to Your Account")


    fill_in :username, with: 'learner@test.com'
    fill_in :password, with: 'testing'

    click_button 'Log In'

    expect(current_path). to eq("/learners/#{@learner.id}/quizzes")

  end

  it 'can show all available quizzes for a learner to take' do
    save_and_open_page
    expect(page).to have_content("Available Quizzes")
    expect(page).to have_link("#{@quiz1.id}")
    expect(page).to have_link("#{@quiz2.id}")
  end

end
