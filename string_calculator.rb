class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    input.split(/,|\n/).map(&:to_i).sum
  end
end
