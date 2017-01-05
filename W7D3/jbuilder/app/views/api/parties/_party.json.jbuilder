json.extract! party, :name


json.guests do
  json.array! party.guests do |guest|
    json.partial! 'api/guests/guest', guest: guest
    json.gifts guest.gifts, partial: 'api/gifts/gift', as: :gift

  end
end
