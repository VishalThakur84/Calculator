class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      input = parts[1]
    end

    input.split(/#{delimiter}|,|\n/).map(&:to_i).sum
  end
end

