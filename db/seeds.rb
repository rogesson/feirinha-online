# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Alimentos')
Category.create(name: 'Vestuário')
Category.create(name: 'Brinquedos')
Category.create(name: 'Ornamentos')

User.create(name: 'Teste', email: 'teste@mail.com', password: '123456', cpf: CPF.generate)

Store.create(name: 'Loja Teste', category_id: 1, user_id: 1)
