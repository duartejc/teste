#!/usr/bin/env ruby
require 'optparse'
require 'rake/testtask'
require_relative 'context'
require_relative 'strategy_test'

options = {}
strategies = []

OptionParser.new do |opts|
	opts.banner = "Modo de uso: ./app [opções] cupons.csv	products.csv	orders.csv	order_items.csv	totals.csv"

	#Opção para execução em modo verboso
	opts.on("-v", "--[no-]verbose", "Executar em modo verboso") do |v|
		options[:verbose] = v
	end
	
	#Opção para execução dos testes unitários
	opts.on("-t", "--test", "Executar os testes unitários") do |t|
		strategies.push Context.new(StrategyTest)
	end
end.parse!

raise ArgumentError, "Número errado de argumentos (#{ARGV.size} de 5)" unless ARGV.size == 5

strategies.each { |s| s.execute}
