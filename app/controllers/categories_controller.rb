class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create()
    # need to get the new category name from a form
    # name = params[:name]

    Category.create(name: name) if current_user.admin?
  end