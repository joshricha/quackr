require 'rails_helper'

RSpec.feature 'category management', focus: true do

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

    scenario 'view category list' do
      c1 = Category.create name: 'ruby'    
      c2 = Category.create name: 'javascript'

      visit categories_path
      expect(page).to have_text('ruby').and have_text 'javascript'

    end

    scenario 'create new category'
    scenario 'update existing category'

  end

end