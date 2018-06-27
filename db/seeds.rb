# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_admin = User.create(name: 'admin', nickname: 'admin', password: 'asdf')
user_user = User.create(name: 'user', nickname: 'user', password: 'asdf')

shelf_admin = Shelf.create(user: user_admin)
shelf_user = Shelf.create(user: user_user)

book_harry = Book.create(title: 'Harry Potter', author: 'J K Rowling', publication: DateTime.strptime("09/02/2009", "%d/%m/%Y"), code: 0, genre: "epopeia", shelf: shelf_admin)
book_narnia = Book.create(title: 'Narnia', author: 'C S Lewis', publication: DateTime.strptime("16/04/2011", "%d/%m/%Y"), code: 1, genre: "conto", shelf: shelf_admin)
book_got = Book.create(title: 'Game of Thrones', author: 'R R Martin', publication: DateTime.strptime("21/07/2013", "%d/%m/%Y"), code: 2, genre: "romance", shelf: shelf_admin)
book_bichos = Book.create(title: 'A Revolução dos Bichos', author: 'George Orwell', publication: DateTime.strptime("22/09/2013", "%d/%m/%Y"), code: 3, genre: "ensaio", shelf: shelf_user)
book_1984 = Book.create(title: '1984', author: 'George Orwell', publication: DateTime.strptime("26/11/2016", "%d/%m/%Y"), code: 4, genre: "novela", shelf: shelf_user)
bool_cool = Book.create(title: 'Cool It', author: 'Bjorn Lomborg', publication: DateTime.strptime("28/05/2018", "%d/%m/%Y"), code: 5, genre: "epopeia", shelf: shelf_user)

Review.create(description: 'Harry é um livro lixo', book: book_harry)
Review.create(description: 'Potter é um livro lixo', book: book_harry)
Review.create(description: 'Harry Potter é um livro lixo', book: book_harry)
Review.create(description: 'Narnia é um livro lixo', book: book_narnia)
Review.create(description: 'Narnia é um livro bom', book: book_narnia)
Review.create(description: 'A Revolução dos Bichos é um livro bom', book: book_bichos)
