#!/usr/bin/ruby

require 'date'
require 'json'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: DisplayUserProfit.rb [options]"

  opts.on("-i", "--ignore-donuts", "Disregard all donut-related transactions from the spending.") do |i|
    options[:ignoreDonuts] = i
  end
end.parse!


def getAllTransactionsForUser
  #TODO:  figure out how to make the HTTP request using rest-client library, or similar
  response = `curl -H 'Accept: application/json' -H 'Content-Type: application/json' -X POST -d '{"args": {"uid": 1110590645, "token": "03A0A9508592104766A1D396EF95D5CE", "api-token": "AppTokenForInterview", "json-strict-mode": false, "json-verbose-response": false}}' https://2016.api.levelmoney.com/api/v2/core/get-all-transactions`
  results = JSON.parse(response.to_str)
  
  if results['error'] != 'no-error' then 
    warn results['error'] 
    return []
  else
    return results['transactions']
  end
end

monthly_aggregations = Hash.new
user_transactions = getAllTransactionsForUser

user_transactions.each do |trans|
  date = Date.parse(trans['transaction-time'])
  date_formatted = date.strftime('%Y-%m')

  #initialize if new month
  if !monthly_aggregations[date_formatted] then 
    monthly_aggregations[date_formatted] = {'spent' =>  0,'income' => 0}
  end

  if trans['amount'] > 0 then 
    monthly_aggregations[date_formatted]['income'] += trans['amount']
  else
    # dont count spending if options[:ignoreDonuts] is set
    next if options[:ignoreDonuts] and trans['merchant'] == ('Krispy Kreme Donuts' or 'DUNKIN #336784')
    monthly_aggregations[date_formatted]['spent'] += trans['amount']
  end
end


#Print to screen

puts "YYYY-MM\tSpent\t\tIncome"

num_months = 0
total_spent = 0
total_income = 0

monthly_aggregations.sort.each do |month,subtotal|
  puts "#{month}\t#{subtotal['spent']}\t#{subtotal['income']}"
  num_months += 1
  total_spent += subtotal['spent']
  total_income += subtotal['income']
end

average_spent = total_spent / num_months
average_income = total_income / num_months

puts "Average\t#{average_spent}\t#{average_income}"
