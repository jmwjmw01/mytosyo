# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(email: 'admin@email.com', name: 'admin', password: 'hogehoge', role: 'admin')
User.create(email: 'user1@email.com', name: 'user1', password: 'hogehoge', role: 'member')
User.create(email: 'user2@email.com', name: 'user2', password: 'hogehoge', role: 'member')
User.create(email: 'user3@email.com', name: 'user3', password: 'hogehoge', role: 'member')
User.create(email: 'user4@email.com', name: 'user4', password: 'hogehoge', role: 'member')
User.create(email: 'user5@email.com', name: 'user5', password: 'hogehoge', role: 'member')
