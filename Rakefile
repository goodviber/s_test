require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "simplyb"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Get Quotes'
task :run do

  insurers = []
  insurers << Insurer.new("insurer_a", ["windows", "contents"])
  insurers << Insurer.new("insurer_b", ["tires", "contents"])
  insurers << Insurer.new("insurer_c", ["doors", "engine"])

  request = Request.new({"tires" => 10, "windows" => 30, "engine" => 40, "contents" => 60, "doors" => 15})

  quote_rules = []
  insurers.each do |insurer|
    quote_rules << QuoteRule.two_match_rule(insurer)
    quote_rules << QuoteRule.single_match_rule(insurer)
  end

  quote_manager = QuoteManager.new(quote_rules)
  quote_manager.quote_for(request)
end
