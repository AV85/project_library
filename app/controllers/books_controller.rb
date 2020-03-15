# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.all
  end

  def show
    @categories = Category.all
    @book = Book.find(params[:id])
  end
end
