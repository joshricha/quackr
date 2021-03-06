class QuestionsController < ApplicationController
  helper_method :find_status

  def index
    @questions = Question.all
    @questions = Question.order(:id).page(params[:page]).per(10)
  end

  def show
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to edit_question_path(@question), :notice => 'Question is successfully saved'
    else
      render :new
    end
  end

  def status_category
    @questions = Question.where(status: params[:status])
    render :index
  end

  def find_status
    Question.select(:status).map(&:status).uniq
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end