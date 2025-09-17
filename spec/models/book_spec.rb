require 'rails_helper'


RSpec.describe 'Book management', type: :feature do
  context 'validations' do
    it 'is invalid without a title' do
      book = Book.new(title: nil, author: nil)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end
  end
    it 'is invalid without an author' do
      book = Book.new(title: 'Some Title', author: nil)
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

     it 'is invalid without a price' do
      book = Book.new(title: 'Some Title', price: nil)
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("can't be blank")
    end

     it 'is invalid with a non-positive price' do
      book = Book.new(title: 'Some Title', price: -5)
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("must be greater than 0")
    end

    it 'is invalid without a published_date' do
      book = Book.new(title: 'Some Title', published_date: nil)
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end
    
end
