require './string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself when one number is provided" do
      expect(StringCalculator.add("4")).to eq(4)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(StringCalculator.add("2,3")).to eq(5)
    end

    it "returns the sum of multiple comma-separated numbers" do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum when newlines are used as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
    
    it "supports custom delimiter defined in format //delimiter\\n" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
    
    it "raises an error if negative numbers are given" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negatives not allowed: -2, -4")
    end
    
    it "ignores numbers greater than 1000" do
      expect(StringCalculator.add("2,1001,6")).to eq(8)
    end
    
    it "supports custom delimiter of any length" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple custom delimiters" do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
    
    
  end
end
