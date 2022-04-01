require 'rails_helper'


describe 'Welcome Page' do
  it 'can show a button to login as a learner' do
    visit '/'
    expect(page).to have_button('learner-login')
    click_button 'learner-login'
    expect(current_path).to eq("/login")
  end

  it 'can show a button login as a manager' do
    visit '/'
    expect(page).to have_button('manager-login')
    click_button 'manager-login'
    expect(current_path).to eq("/login")

  end

end
