require 'rails_helper'

RSpec.describe Question, :focus => true, :type => :model do

  it "new question defaults to draft" do
    question = Question.new
    expect(question.status).to eq 'draft'
  end

  it 'cannot save question without title' do
    question = Question.new
    expect(question.save).to eq false
  end

  it 'cannot save question without one of the 3 status' do
    question = Question.create()
    expect(question.status).to eq ("draft" || "published")
  end

  describe '#body_html' do

    context 'when body contains valid markdown' do

      it 'converts markdown in body and return html' do
        # '### h3 title'
        # "<h3>h3 title</h3>\n"

        question = Question.new
        question.body = '### h3 title'
        expect(question.body_html).to eq("<h3>h3 title</h3>\n")
      end

    end

    context 'when body is nil' do

      it 'returns empty string' do

        question = Question.new
        expect(question.body_html).to eq ""
      end
    end

  end

end
