require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get '/' do
  @words = Word.all()
  erb(:index)
end

post '/' do
  word = Word.new({:word => params['word']})
  word.save()
  @words = Word.all()
  erb(:index)
end

get '/word/:id' do
  @word = Word.find(params['id'].to_i)
  erb(:word_definition)
end

post '/word/:id' do
  word = Word.find(params['id'].to_i)
  word.add_definition(params.fetch('defin'))
  @word = word
  erb(:word_definition)
end
