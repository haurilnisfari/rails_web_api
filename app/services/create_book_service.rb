class CreateBookService < ApplicationService
    attr_reader :title, :price, :description
    def initialize(title, price, description)
      @title = title
      @price = price
      @description = description
    end

    def call
      prev_book = Book.find_by title: @title
      raise StandardError, 'Book already exists' if prev_book.present?

      Book.create(title: @title, price: @price, description: @description)
    end
  end

