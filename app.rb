require 'sinatra'
require './lib/profile'

set :application_id, '27ee934210453a137fcf85c9acfa778e8ec4a3a915e90f109a6619ac695eb1c1'
set :secret, '87a22e81766a47efd340b014995347e7efd2c138a8d72fe30f485487fcdaf818'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = 100

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)

  erb :primes, :layout => :main
end

get '/' do
  if signed_in?
    @profile = trainee.get_profile
  end

  erb :index, :layout => :main
end

get '/update' do 
  if signed_in?
    @profile = trainee.get_profile
  end
  
  erb :update, :layout => :main
end

post '/update' do
  response = trainee.update_profile(params)

  if @errors = response["errors"]
    erb :error, :layout => :main
  else
    redirect '/'
  end
end

include Sinatra::OauthRoutes

def trainee
  @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
end