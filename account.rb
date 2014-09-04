class Account
  attr_reader :starting_balance, :name
  attr_accessor :transactions, :current_balance
  def initialize(accounts_hash)
    @transactions = []
    @starting_balance = accounts_hash[:balance].to_f
    @name = accounts_hash[:account]
    @current_balance = starting_balance
  end

  def summary
    transactions.each do |transaction|
      transaction.summary
    end
    nil
  end

  def get_current_balance
    transactions.each do |transaction|
      @current_balance += transaction.amount
    end
    @current_balance
  end
end
