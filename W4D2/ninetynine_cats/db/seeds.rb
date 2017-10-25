# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# birth_date = '2017-10-27'

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create!(name: 'Kitty', sex: 'F', birth_date: '2015-10-21', color: 'yellow', description: 'Persian')
cat2 = Cat.create!(name: 'Pug', sex: 'M', birth_date: '2016-11-01', color: 'calico', description: 'American Curl')

request1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2015-10-10', end_date: '2015-10-11', status: 'APPROVED' )
request2 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2015-10-10', end_date: '2015-10-11', status: 'APPROVED' )

request3 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2015-10-09', end_date: '2015-10-11', status: 'PENDING' )
# request4 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2015-10-10', end_date: '2015-10-11', status: 'APPROVED' )
