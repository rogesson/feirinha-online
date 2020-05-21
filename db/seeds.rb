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

Status.create(name: 'Inativo')
Status.create(name: 'Ativo')
Status.create(name: 'Pendente')

OrderStatus.create(name: 'Aberto')
OrderStatus.create(name: 'Enviado')
OrderStatus.create(name: 'Entregue')
OrderStatus.create(name: 'Cancelado')

User.create(name: 'Teste', email: 'teste@mail.com', password: '123456', doc_number: CPF.generate)
User.create(name: 'Teste2', email: 'teste2@mail.com', password: '123456', doc_number: CPF.generate)

Store.create(name: 'Loja Teste', category_id: Category.first.id, user_id: User.first.id, status_id: Status.second.id)

Product.create(name: 'Cebola', price: 1, store_id: Store.first.id)
Product.create(name: 'Milho', price: 2, store_id: Store.first.id)
