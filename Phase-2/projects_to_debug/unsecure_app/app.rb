require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
  if invalid_request_parameters?
    status 400
    return ''
  end
    # @name = Rack::Utils.escape_html(params[:name])
    # return erb(:hello)

    @name = params[:name]
    return erb(:hello)
  end

  def invalid_request_parameters?
  # Are the params nil?
  return true if params[:name] == nil || params[:name] == ""
  return true if params[:name].include?("<")

  return false
end
end
