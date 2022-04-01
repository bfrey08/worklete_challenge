require 'rails_helper'


describe 'Login Page' do


  it 'can show a form that requires a username and password' do
    @learner = Learner.new(username: 'learner@test.com', password: 'testing')
    @learner.password = 'testing'
    @learner.save
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

  it 'can redirect to the appropriate page either learner or manager show' do
    @manager = Manager.new(username: 'manager@test.com', password: 'testing')
    @manager.password = 'testing'
    @manager.save

    visit '/'
    expect(page).to have_button('Manager Login')
    click_button 'Manager Login'
    expect(current_path).to eq("/login")

    expect(page).to have_content("Log In to Your Account")
    fill_in :username, with: 'manager@test.com'
    fill_in :password, with: 'testing'

    click_button 'Log In'
    expect(current_path). to eq("/managers/#{@manager.id}/quizzes")

  end

end
