class Api::V1::BooksController < ApplicationController

  def index
    begin
      ActiveRecord::Base.transaction do
        # Index Book
        books = IndexBookService.call
        render json: { books: books }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        # Create Book
        book = CreateBookService.call(params[:title], params[:price], params[:description])
        render json: { book: book }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        # Show Book
        book = ShowBookService.call(params[:id])
        render json: { book: book }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end
  
  def destroy
    begin
      ActiveRecord::Base.transaction do
        books = IndexBookService.call
        # Destroy Book
        book = DestroyBookService.call(params[:id])
        render json: { books: books }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end


end
