class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      input = parts[1]
    end

    numbers = input.split(/#{delimiter}|,|\n/).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.reject { |n| n > 1000 }.sum
  end
end
