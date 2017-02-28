require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/transaction.rb')

get '/transactions/index' do
@transactions = Transaction.all
@categories = Category.all
erb(:"transactions/index")
end

get '/transactions/new' do
  @categories = Category.all
  erb(:"transactions/new")
end

post '/transactions' do
transaction = Transaction.new(params)
transaction.save
redirect to("dashboard")
end
