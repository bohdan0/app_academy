require 'addressable/uri'
require 'rest-client'

def index_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

begin
  result = RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
rescue RestClient::Exception => e
  puts e.message
end

  puts result
end

def show(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}.html",
    # query_values: {
    #   :id => id
    # }
  ).to_s

  puts RestClient.get(url)
end

show(2)
