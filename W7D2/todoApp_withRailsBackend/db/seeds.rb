# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
todo1 = Todo.create(title: 'sleep', body: 'for long time', tag_names: ['hello'])
todo2 = Todo.create(title: 'study', body: 'hard', done: false, tag_names: ['a', 'b'])
todo3 = Todo.create(title: 'pass assessment', body: 'for sure', done: true, tag_names: [])
