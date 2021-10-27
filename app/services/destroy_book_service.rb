class DestroyBookService < ApplicationService
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def call
    @book = Book.find(@id)
    @book.destroy
  end
end

