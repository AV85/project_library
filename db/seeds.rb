# frozen_string_literal: true

require 'ffaker'

User.destroy_all
Category.destroy_all
Book.destroy_all

User.create!(email: 'admin@email.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: 'John',
             last_name: 'Doe',
             role: 1)

User.create!(email: 'supermoderator@email.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 2)

User.create!(email: 'moderator@email.com',
             password: 'password',
             password_confirmation: 'password',
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             role: 3)

author_attributes = [
  { first_name: 'John', last_name: 'Smith' },
  { first_name: 'Jane', last_name: 'Lorain' },
  { first_name: 'Adam', last_name: 'Lost' },
  { first_name: 'Jack', last_name: 'Span' },
  { first_name: 'Ross', last_name: 'Gellow' },
  { first_name: 'Solly', last_name: 'Visk' },
  { first_name: 'Piter', last_name: 'Losk' },
  { first_name: 'Antonio', last_name: 'Biring' },
  { first_name: 'Marsel', last_name: 'Rosky' },
  { first_name: 'Andrew', last_name: 'Flashman' }
]

author_attributes.each do |attributes|
  Author.where(attributes).first_or_create
end

category_attributes = [
  { name: 'Alternative history', description: FFaker::Lorem.sentence },
  { name: 'Combat fantasy', description: FFaker::Lorem.sentence },
  { name: 'Detective fiction', description: FFaker::Lorem.sentence },
  { name: 'Detectives and thrillers', description: FFaker::Lorem.sentence },
  { name: "Children's books", description: FFaker::Lorem.sentence },
  { name: 'Historical Romance', description: FFaker::Lorem.sentence },
  { name: 'Historical adventures', description: FFaker::Lorem.sentence },
  { name: 'Space fiction', description: FFaker::Lorem.sentence },
  { name: 'Prose', description: FFaker::Lorem.sentence },
  { name: 'Horror and mysticism', description: FFaker::Lorem.sentence }
]

category_attributes.each do |attributes|
  Category.where(attributes).first_or_create
end

category1 = Category.find_by_name('Alternative history')
category2 = Category.find_by_name('Combat fantasy')
category3 = Category.find_by_name('Detective fiction')
category4 = Category.find_by_name('Detectives and thrillers')
category5 = Category.find_by_name('Children\'s books')

author1 = Author.find_by(first_name: 'John')
author2 = Author.find_by(first_name: 'Jane')
author3 = Author.find_by(first_name: 'Adam')
author4 = Author.find_by(first_name: 'Jack')
author5 = Author.find_by(first_name: 'Piter')

book_attributes = [
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category1 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category2 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category3 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category4 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category5 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category1 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category2 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category3 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category4 },
  { name: FFaker::Lorem.word, description: FFaker::Lorem.sentence, category_id: category5 }
]

book_attributes.each do |attributes|
  book = Book.where(attributes).first_or_create
  book.authors << author1
end

book1 = Book.first
book2 = Book.second
book3 = Book.last

book1.authors << author2
book2.authors << author3
book3.authors << author4
