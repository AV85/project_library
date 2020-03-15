# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @books = Book.where(category_id: params[:id])
  end
end
