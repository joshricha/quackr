require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.feature 'home page' do

  context 'when logged in' do

    let(:user) do
      user = User.new(:email => 'test@test.com')
      user.username = 'testaccount'
      user.password = user.password_confirmation = 'password'
      user.save
      user
    end

    before(:each) do
      login_as(user, :scope => :user)
    end

    scenario 'view home page' do
      visit root_path
      expect(page).to have_text('Home page')
    end
  end


  context 'when logged out' do

    scenario 'attempt to view home page' do
      visit root_path
      expect(page).to have_text('Log in')
    end

  end

end