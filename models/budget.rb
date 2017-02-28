require_relative('../db/sql_runner.rb')

class Budget

  attr_accessor :total_budget 
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i
    @total_budget = options['total_budget'].to_f
  end

  # def self.budget_by_user(id_required)
  #   sql = "SELECT * FROM budgets WHERE user_id = #{id_required}"
  #   budget = SqlRunner.run(sql)
  #   result = Budget.new(budget.first)
  #   return result
  # end

  def save
    sql = "INSERT INTO budgets (total_budget) VALUES (#{@total_budget}) RETURNING id"
    budget = SqlRunner.run(sql).first
    @id = budget['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM budgets"
    return self.get_many(sql)
  end

  def self.return_by_id(id_required)
    sql = "SELECT * FROM budgets WHERE id = #{id_required}"
    budget = SqlRunner.run(sql)
    result = Budget.new(budget.first)
    return result
  end

  def update()
    sql = "UPDATE budgets SET
    total_budget = #{@total_budget} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id_required)
    sql = "DELETE FROM budgets WHERE id = #{id_required}"
    budget = SqlRunner.run(sql)
    result = Budget.new(budget.first)
    return result
  end

  def self.get_many(sql)
    budgets = SqlRunner.run(sql)
    result = budgets.map {|budget| Budget.new(budget)}
    return result
  end

end