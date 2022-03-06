require 'feast/api'

api = Feast::API.new
MyApp = api.get('/') do
  { message: 'Hello World' }.to_json
end
