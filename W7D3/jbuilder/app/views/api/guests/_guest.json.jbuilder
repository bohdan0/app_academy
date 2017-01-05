if guest.age.between?(40, 50)
  json.extract! guest, :name, :age, :favorite_color
end
