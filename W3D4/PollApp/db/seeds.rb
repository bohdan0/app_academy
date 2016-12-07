# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(user_name: 'isai')
user2 = User.create!(user_name: 'bohdan')
user3 = User.create!(user_name: 'alex')

favorites = Poll.create!(title: 'favorites', author_id: user1.id)

fav_color = Question.create!(text: 'your favorite color?', poll_id: favorites.id)
fav_food = Question.create!(text: 'your favorite food?', poll_id: favorites.id)
fav_movie = Question.create!(text: 'your favorite movie?', poll_id: favorites.id)

fav_col_answer1 = AnswerChoice.create!(text: 'red', question_id: fav_color.id)
fav_col_answer2 = AnswerChoice.create!(text: 'blue', question_id: fav_color.id)

fav_food_answer1 = AnswerChoice.create!(text: 'pizza', question_id: fav_food.id)
fav_food_answer2 = AnswerChoice.create!(text: 'hamburger', question_id: fav_food.id)

fav_movie_answer1 = AnswerChoice.create!(text: 'Star Wars', question_id: fav_movie.id)
fav_movie_answer2 = AnswerChoice.create!(text: 'Iron Man', question_id: fav_movie.id)

fav_color_response1 = Response.create!(question_id: fav_color.id, answer_choice_id: fav_col_answer1.id, user_id: 2)
fav_color_response2 = Response.create!(question_id: fav_color.id, answer_choice_id: fav_col_answer2.id, user_id: 3)
