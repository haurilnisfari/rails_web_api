class IndexBookService < ApplicationService
  def initialize
  end

  def call
    Book.all
  end
end

