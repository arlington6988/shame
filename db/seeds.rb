# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(first_name: 'Jon', last_name: 'Jones', email: 'Jon.Jones@gmail.com', username: 'jjones', password: 'temp123')
User.create(first_name: 'Janice', last_name: 'Jones', email: 'Janice.Jones@gmail.com', username: 'jjones2', password: 'temp123')
Business.create(name: 'Popeyes', address: '2435 Chamblee Tucker rd. Atlanta, GA 30084', rating: 1)
Business.create(name: 'McDonalds', address: '1000 Roswell rd. Atlanta, GA 30084', rating: 1)
Review.create(story: 'I went to Popeyes and it was disguisting', business_id: Business.first.id, user_id: User.first.id)
Review.create(story: 'I went to McDonalds and it was disguisting', business_id: Business.second.id, user_id: User.second.id)


