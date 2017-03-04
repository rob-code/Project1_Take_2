require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/category.rb')



get '/categories/new' do
@categories = Category.all
erb(:'categories/new')
end

get '/categories/manage' do
@categories = Category.all
erb(:'categories/manage')
end

post '/categories' do
@category = Category.new(params)
@category.save
redirect to('categories/manage')
end

post '/categories/:id/delete' do
Category.delete_by_id(params[:id])
redirect to("categories/manage")
end

get '/categories/:id/edit' do
@category = Category.find_by_id(params[:id])
erb(:'categories/edit')
end

post '/categories/:id/edit' do
@category = Category.new(params)
@category.update()
redirect to("categories/manage")
end


get '/categories/:id' do
@category = Category.find_by_id(params[:id])
@transactions = Transaction.all
erb(:"/categories/index")
end