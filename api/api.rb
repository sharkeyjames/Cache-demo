require "sinatra"
require "sinatra/cors"

# Configuration
set :allow_origin, "http://localhost:3000"
set :allow_methods, "GET,POST"
set :allow_headers, "content-type,if-modified-since,if-none-match"

# Routes
get "/name" do
  last_modified(GlobalState[:last_modified])
  GlobalState[:name]
end

post "/name" do
  update_name(request.body.read.to_s)
end

get "/favourite-food" do
  etag(GlobalState[:favourite_food].hash)
  GlobalState[:favourite_food]
end

post "/favourite-food" do
  GlobalState[:favourite_food] = request.body.read.to_s
end

# Methods
def update_name(name)
  GlobalState[:name] = name
  GlobalState[:last_modified] = Time.now
end

# Initialise state
GlobalState = {}
update_name("James")
GlobalState[:favourite_food] = "Sushi"
