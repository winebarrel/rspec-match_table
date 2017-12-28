module RSpecMatchTable
  def check_type(obj)
    unless obj.is_a?(Array)
      raise TypeError, "wrong type #{obj.inspect} (expected Array)"
    end
  end
  module_function :check_type

  def build_failure_message(expected, actual)
    message = <<-EOS.strip
expected: #{expected.inspect}
     got: #{actual.inspect}
    EOS

    diff = RSpec::Expectations.differ.diff(actual.pretty_inspect, expected.pretty_inspect)

    unless diff.strip.empty?
      diff_label = RSpec::Matchers::ExpectedsForMultipleDiffs::DEFAULT_DIFF_LABEL
      message << "\n\n" << diff_label << diff
    end

    message
  end
  module_function :build_failure_message
end
