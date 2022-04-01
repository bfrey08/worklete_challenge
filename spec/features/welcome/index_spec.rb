require 'rails_helper'


describe 'Welcome Page' do
  it 'can show a button to login as a learner' do
    visit '/'
    expect(page).to have_button('Learner Login')
    click_button 'Learner Login'
    expect(current_path).to eq("/login")
  end

  it 'can show a button login as a manager' do
    visit '/'
    save_and_open_page
    expect(page).to have_button('Manager Login')
    click_button 'Manager Login'
    expect(current_path).to eq("/login")

  end

end
