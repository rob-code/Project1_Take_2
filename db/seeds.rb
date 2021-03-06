require_relative( '../models/budget.rb' )
require_relative( '../models/category.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/target.rb' )

require('pry-byebug')

Budget.delete_all
Category.delete_all
Target.delete_all
Transaction.delete_all

budget1 = Budget.new({
'total_budget' => 3000
})

budget1.save

category1 = Category.new({
'name' => 'Food'
})

category2 = Category.new({
'name' => 'Electricity'
})

category3 = Category.new({
'name' => 'Gas'
})

category4 = Category.new({
'name' => 'Mobile Phone'
})

category5 = Category.new({
'name' => 'Eating Out'
})

category6 = Category.new({
'name' => 'Clothes'
})

category7 = Category.new({
'name' => 'Cinema'
})

category1.save
category2.save
category3.save
category4.save
category5.save
category6.save
category7.save


target1 = Target.new({
'amount' => 30,
'category_id' => category1.id
})
target2 = Target.new({
'amount' => 200,
'category_id' => category6.id
})
target3 = Target.new({
'amount' => 25,
'category_id' => category7.id
})

target4 = Target.new({
'amount' => 150,
'category_id' => category1.id
})

target1.save
target2.save
target3.save
target4.save


transaction1 = Transaction.new({
'merchant_name' => "Waitrose",
'amount' => 37,
'category_id' => category1.id
})
transaction2 = Transaction.new({
'merchant_name' => "Marks and Spencer",
'amount' => 120,
'category_id' => category6.id
})
transaction3 = Transaction.new({
'merchant_name' => "Lidl",
'amount' => 27,
'category_id' => category1.id
})
transaction4 = Transaction.new({
'merchant_name' => "PriMark",
'amount' => 18,
'category_id' => category6.id
})
transaction5 = Transaction.new({
'merchant_name' => "Tesco",
'amount' => 18,
'category_id' => category1.id
})
transaction6 = Transaction.new({
'merchant_name' => "Lidl",
'amount' => 190,
'category_id' => category1.id
})
transaction7 = Transaction.new({
'merchant_name' => "Tesco",
'amount' => 120,
'category_id' => category1.id
})
transaction8 = Transaction.new({
'merchant_name' => "TalkTalk",
'amount' => 120,
'category_id' => category4.id
})
transaction9 = Transaction.new({
'merchant_name' => "Pizza Express",
'amount' => 120,
'category_id' => category5.id
})


transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save

binding.pry
nil
