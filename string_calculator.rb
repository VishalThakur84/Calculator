class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    input.split(",").map(&:to_i).sum
  end
end
