require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/category.rb')



get '/categories/new' do
@categories = Category.all
erb(:'categories/new')
end

post '/categories' do
@category = Category.new(params)
@category.save
redirect to("dashboard")
end


get '/categories/:id' do
@category = Category.return_by_id(params[:id])
@transactions = Transaction.all
erb(:"/categories/index")
end