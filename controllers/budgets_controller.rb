require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require('./models/budget.rb')

get '/budgets/:id/edit' do 
@budget = Budget.find_by_id(params[:id])
erb(:'budgets/edit')
end

post '/budgets/:id/update' do
budget = Budget.new(params)
budget.update
redirect to("dashboard")
end



