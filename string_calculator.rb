class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiters = [",", "\n"]

    if input.start_with?("//")
      delimiter_section, input = input.split("\n", 2)
      delimiters += delimiter_section.scan(/\[(.*?)\]/).flatten
      if delimiters.empty? # single char delimiter (no square brackets)
        delimiters << delimiter_section[2]
      end
    end

    numbers = input.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.reject { |n| n > 1000 }.sum
  end
end

