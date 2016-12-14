10.times do |i|
  User.create(user_name: "user#{i+1}", password: "password")
end

99.times do |i|
  birth_date = Faker::Time.between(10.years.ago, Date.today, :all)
  color = Cat::CAT_COLORS.sample
  name = Faker::Pokemon.name
  sex = ["M","F"].sample
  description = Faker::Lorem.paragraph(2, true, 4)
  user_id = (1..10).to_a.sample
  Cat.create(
  birth_date: birth_date,
  color: color,
  name: name,
  sex: sex,
  description: description,
  user_id: user_id)
end

1000.times do |i|
  cat_id = (1..99).to_a.sample
  start_date = Faker::Time.between(1.days.from_now, 1.week.from_now, :all)
  end_date = Faker::Time.between(1.week.from_now, 5.month.from_now, :all)
  user_id = (1..10).to_a.sample
  CatRentalRequest.create(
  cat_id: cat_id,
  start_date: start_date,
  end_date: end_date,
  user_id: user_id)
end
