require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film')
also_reload('./models/*')

get '/films' do
  @filmlist = Film.all
  erb(:films)
end

get '/about_us' do
  erb(:about_us)
end

get '/' do
  erb(:home)
end
