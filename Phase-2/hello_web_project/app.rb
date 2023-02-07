require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do
   return erb(:index)
  end

  get '/names' do
    names = params[:names]
    return "#{names}"
  end

  post '/sort-names' do
    names = params[:names]
    return names.split(",").sort.join(",")
  end
end


# get '/' do
#     return "Hello"
# end

# get '/hello' do
#     name = params[:name]
#     return "Hello #{name}"
# end

# post '/submit' do
#     name = params[:name]
#     message = params[:message]

#     return "Thanks #{name}, you sent this message: #{message}"
# end