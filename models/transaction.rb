require_relative('../db/sql_runner.rb')
require_relative('./crud.rb')


class Transaction < Crud

  attr_accessor :merchant_name, :amount, :category_id
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @amount = options['amount'].to_f
    @category_id = options['category_id'].to_i
  end

  # def self.all_for_user(user_id)
  #   sql = "SELECT * FROM transactions WHERE user_id = #{user_id}"
  #   return self.get_many(sql)
  # end

# def total_spend()
#   sql = "SELECT SUM(transactions.amount) FROM transactions"
#   total_spend = SqlRunner.run(sql).first
#   return total_spend['sum'].to_f
# end




def self.spend_by_category()
  sql = "SELECT categories.id, categories.name, SUM(transactions.amount) FROM transactions INNER JOIN categories ON categories.id = transactions.category_id GROUP BY categories.id"
  return SqlRunner.run(sql)
end

def self.subcategories(cat_id)
  sql = "SELECT * FROM transactions WHERE category_id = #{cat_id}"
  return self.get_many(sql)
end

def save()
  sql = "INSERT INTO transactions (merchant_name, amount, category_id) VALUES ('#{@merchant_name}', #{@amount}, #{@category_id})RETURNING id"
  transaction = SqlRunner.run(sql).first
  @id = transaction['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
end

def self.all
  sql = "SELECT * FROM transactions"
  return self.get_many(sql)
end

def self.find_by_id(id_required)
  sql = "SELECT * FROM transactions WHERE id = #{id_required}"
  transaction = SqlRunner.run(sql)
  result = Transaction.new(transaction.first)
  return result
end

def update()
  sql = "UPDATE transactions SET
  merchant_name = '#{@merchant_name}',
  amount = '#{@amount}',
  category_id = '#{@category_id}'
  WHERE id = #{@id}"
  SqlRunner.run(sql)
end

def self.delete_by_id(id_required)
  sql = "DELETE FROM transactions WHERE id = #{id_required}"
  SqlRunner.run(sql)
end

def self.get_many(sql)
  transactions = SqlRunner.run(sql)
  result = transactions.map {|transaction| Transaction.new(transaction)}
  return result
end


end

