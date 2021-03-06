require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/transaction.rb')

get '/transactions' do
@transactions = Transaction.all
@categories = Category.all
erb(:"transactions/index")
end

get '/transactions/new' do
  @categories = Category.all
  erb(:"transactions/new")
end

post '/transactions' do
@transaction = Transaction.new(params)
@transaction.save
@categories = Category.find_by_id(@transaction.category_id)
erb(:'transactions/confirm')
end

get '/transactions/:id/edit' do
@transaction = Transaction.find_by_id(params[:id])
@categories = Category.all
erb(:'transactions/edit')
end

post '/transactions/:id/edit' do
@transaction = Transaction.new(params)
@transaction.update()
redirect to("dashboard")
end


post '/transactions/:id/delete' do
Transaction.delete_by_id(params[:id])
redirect to("dashboard")
end
