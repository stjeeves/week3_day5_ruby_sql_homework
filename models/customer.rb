require_relative("../db/sql_runner")

class Customer

attr_accessor :name, :funds
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save
    sql = "INSERT INTO customers (name, funds) values ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE ID = $3"
    values = [@name, @funds]
    SqlRunner.run(sql, values)
  end

  def films_booked
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON tickets.customer_id = customer_id WHERE film_id = $1"
          values = [@id]
          customers = SqlRunner.run(sql, values)
          results = customers.map{ |customer| Customer.new(customer)}
          return results
  end


  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end





end
