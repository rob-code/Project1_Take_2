require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/category.rb')

get '/categories/:id' do
@category = Category.return_by_id(params[:id])
@transactions = Transaction.all
erb(:"/categories/index")
end