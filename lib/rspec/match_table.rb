require 'pp_sort_hash'
require 'rspec'
require 'rspec/rspec_match_table'

RSpec::Matchers.define :match_table do |expected|
  RSpecMatchTable.check_type(expected)

  match do |actual|
    RSpecMatchTable.check_type(actual)
    expected == actual
  end

  failure_message do |actual|
    RSpecMatchTable.build_failure_message(expected, actual)
  end
end

RSpec::Matchers.define :match_table_without_order do |expected|
  RSpecMatchTable.check_type(expected)

  match do |actual|
    RSpecMatchTable.check_type(actual)
    expected.sort_by(&:to_s) == actual.sort_by(&:to_s)
  end

  failure_message do |actual|
    RSpecMatchTable.build_failure_message(expected, actual)
  end
end
