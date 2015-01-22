# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "admin")
Role.create(name: "user")

Role.first.users.create(name: "Atul", email: "abh@xyz.com", age: nil, gender: nil, password: "random123")

Survey.create(name: "Code Retreat", conducted_on: "2014-10-12")

Survey.first.questions.create(description: "How was the event")
Question.first.options.create(description: "Good")
Question.first.options.create(description: "Bad")

