class ShowBookService < ApplicationService
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def call
    Book.find(@id)
  end
end

