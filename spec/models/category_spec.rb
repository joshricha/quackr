require 'rails_helper'

RSpec.describe Category, :focus => true, :type => :model do
  
  it 'cannot save category without name' do
    category = Category.new
    expect(category.save).to eq false
  end

end
