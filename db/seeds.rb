# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelf_admin = Shelf.create()
shelf_user = Shelf.create()

book_harry = Book.create(title: 'Harry Potter', author: 'J K Rowling', publication: DateTime.strptime("09/02/2009", "%d/%m/%Y"), shelf: shelf_admin)
book_narnia = Book.create(title: 'Narnia', author: 'C S Lewis', publication: DateTime.strptime("16/04/2011", "%d/%m/%Y"), shelf: shelf_admin)
book_got = Book.create(title: 'Game of Thrones', author: 'R R Martin', publication: DateTime.strptime("21/07/2013", "%d/%m/%Y"), shelf: shelf_admin)
book_bichos = Book.create(title: 'A Revolução dos Bichos', author: 'George Orwell', publication: DateTime.strptime("22/09/2013", "%d/%m/%Y"), shelf: shelf_user)
book_1984 = Book.create(title: '1984', author: 'George Orwell', publication: DateTime.strptime("26/11/2016", "%d/%m/%Y"), shelf: shelf_user)
bool_cool = Book.create(title: 'Cool It', author: 'Bjorn Lomborg', publication: DateTime.strptime("28/05/2018", "%d/%m/%Y"), shelf: shelf_user)

Review.create(description: 'Harry é um livro lixo', book: book_harry)
Review.create(description: 'Potter é um livro lixo', book: book_harry)
Review.create(description: 'Harry Potter é um livro lixo', book: book_harry)
Review.create(description: 'Narnia é um livro lixo', book: book_narnia)
Review.create(description: 'Narnia é um livro bom', book: book_narnia)
Review.create(description: 'A Revolução dos Bichos é um livro bom', book: book_bichos)

User.create(name: 'admin', nickname: 'admin', password: 'asdf', shelf: shelf_admin)
User.create(name: 'user', nickname: 'user', password: 'asdf', shelf: shelf_user)
