# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelf = Shelf.new()
user = User.new(name: 'admin', nickname: 'admin', password: '1234', shelf_id: shelf.id).save(validate: false)

shelf.save(validate: false)
