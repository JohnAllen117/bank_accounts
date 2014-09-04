class Transaction
  attr_reader :date, :amount, :description, :account
  def initialize(transaction)
    @date = transaction[:date]
    @amount = transaction[:amount].to_f
    @description = transaction[:description]
    @account = transaction[:account]
  end

  def deposit?
    amount < 0 ? true : false
  end

  def summary
    puts "$#{amount} \t #{self.deposit? ? 'WITHDRAWAL' : 'DEPOSIT'} \t #{date} - #{description}"
  end
end
