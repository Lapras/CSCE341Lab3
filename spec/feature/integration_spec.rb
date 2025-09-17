require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'test_author'
    fill_in 'Price', with: 9.99
    select '2025', from: 'book_published_date_1i'
    select 'September', from: 'book_published_date_2i'
    select '9', from: 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Test Book')
  end

  scenario 'fails to create a book without an author' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: ''
    fill_in 'Price', with: 9.99
    select '2025', from: 'book_published_date_1i'
    select 'September', from: 'book_published_date_2i'
    select '9', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content("Author can't be blank")
  end

  scenario 'fails to create a book without a price' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: ''
    select '2025', from: 'book_published_date_1i'
    select 'September', from: 'book_published_date_2i'
    select '9', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content("Price can't be blank")
  end

  scenario 'fails to create a book with a negative price' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: -10
    select '2025', from: 'book_published_date_1i'
    select 'September', from: 'book_published_date_2i'
    select '9', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content("Price must be greater than 0")
  end

  scenario 'fails to create a book without a published date' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Price', with: 9.99
    click_on 'Create Book'

    expect(page).to have_content("Published date can't be blank")
  end

end