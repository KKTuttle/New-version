require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')

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
  # new_defin = Definition.new({:definition => })

  @word = word
  erb(:word_definition)
end
