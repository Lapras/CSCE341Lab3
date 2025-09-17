Book.create!([
  {
    title: "Harry Potter",
    author: "J.K. Rowling",
    price: 19.99,
    published_date: Date.new(1997, 6, 26)
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    price: 14.99,
    published_date: Date.new(1937, 9, 21)
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    price: 9.99,
    published_date: Date.new(1813, 1, 28)
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    price: 12.99,
    published_date: Date.new(1960, 7, 11)
  },
  {
    title: "1984",
    author: "George Orwell",
    price: 11.99,
    published_date: Date.new(1949, 6, 8)
  }
])

if Rails.env.development?
  # dev only
  Book.create!(
  {
    title: "Hungry Hungry Hippos",
    author: "Dev Devington",
    price: 19.99,
    published_date: Date.new(1997, 6, 26)
  })
elsif Rails.env.test?
  # test only
  Book.create!(
  {
    title: "Testing your wit",
    author: "Test Testington",
    price: 19.99,
    published_date: Date.new(1997, 6, 26)
  })
elsif Rails.env.production?
  # production only
  Book.create!(
  {
    title: "Producing things",
    author: "Produce Producington",
    price: 19.99,
    published_date: Date.new(1997, 6, 26)
  })
end
