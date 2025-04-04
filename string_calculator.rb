class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiters = [",", "\n"]

    if input.start_with?("//")
      delimiter_section, input = input.split("\n", 2)
      if delimiter_section.match?(/\[.+\]/)
        delimiters += delimiter_section.scan(/\[(.*?)\]/).flatten
      else
        delimiters << delimiter_section[2]
      end
    end
    

    numbers = input.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.reject { |n| n > 1000 }.sum
  end
end

