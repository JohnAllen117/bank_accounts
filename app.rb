require_relative 'account'
require_relative 'transaction'
require 'pry'
require 'CSV'
unrefined_accounts = Array.new 0
CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
  unrefined_accounts << row.to_hash
end

unrefined_transactions = Array.new 0
CSV.foreach('bank_data.csv', headers: true, header_converters: :symbol) do |row|
  unrefined_transactions << row.to_hash
end


accounts = []
unrefined_accounts.each do |account|
  current_account = Account.new(account)
  accounts << current_account
  unrefined_transactions.each do |transaction|
    if transaction[:account] == current_account.name
      current_account.transactions << Transaction.new(transaction)
    end
  end
end

binding.pry
