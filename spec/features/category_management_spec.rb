require 'rails_helper'

RSpec.feature 'category management', focus: true do

  scenario 'view category list' do
    c1 = Category.create name: 'ruby'    
    c2 = Category.create name: 'javascript'

    visit categories_path
    expect(page).to have_text('ruby').and have_text 'javascript'

  end

  scenario 'create new category'
  scenario 'update existing category'

end