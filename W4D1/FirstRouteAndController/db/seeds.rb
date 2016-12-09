# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(username: 'bil')
u2 = User.create(username: 'rick')
u3 = User.create(username: 'bob')

c1 = Contact.create(name: u1.username, email: 'bill@mn.io', user_id: u1.id)
c2 = Contact.create(name: u2.username, email: 'rick@mn.io', user_id: u2.id)
c3 = Contact.create(name: u3.username, email: 'bob@mn.io', user_id: u3.id)

# user1 shares with user3
cs1 = ContactShare.create(user_id: u3.id, contact_id: c1.id)
# user1 shares with user2
cs2 = ContactShare.create(user_id: u2.id, contact_id: c1.id)
