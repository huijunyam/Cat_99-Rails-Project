# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cat1 = Cat.create!(birth_date: "2014/01/13", color: 'black', name: 'tom', sex: 'm', description: 'healthy')
cat2 = Cat.create!(birth_date: '2010/07/19', color: 'grey', name: 'jerry', sex: 'm', description: 'slightly healthy')
cat3 = Cat.create!(birth_date: '2009/11/03', color: 'blue', name: 'kitty', sex: 'f', description: 'sick')

cat_rental_request1 = CatRentalRequest.create!(cat_id: cat3.id, start_date: '2015/09/02', end_date: '2015/09/22', status: 'APPROVED')
cat_rental_request2 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2016/09/02', end_date: '2016/10/02', status: 'PENDING')
