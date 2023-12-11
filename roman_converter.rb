class RomanConverter
  def initialize
    @roman_numerals = {
      'I' => 1,
      'IV' => 4,
      'V' => 5,
      'IX' => 9,
      'X' => 10,
      'XL' => 40,
      'L' => 50,
      'XC' => 90,
      'C' => 100,
      'CD' => 400,
      'D' => 500,
      'CM' => 900,
      'M' => 1000
    }
  end

  def to_roman(num)
    result = ''
    @roman_numerals.keys.reverse_each do |symbol|
      while num >= @roman_numerals[symbol]
        result += symbol
        num -= @roman_numerals[symbol]
      end
    end
    result
  end

  def to_integer(roman)
    result = 0
    i = 0
    while i < roman.length
      if i + 1 < roman.length && @roman_numerals[roman[i]] < @roman_numerals[roman[i + 1]]
        result += @roman_numerals[roman[i + 1]] - @roman_numerals[roman[i]]
        i += 2
      else
        result += @roman_numerals[roman[i]]
        i += 1
      end
    end
    result
  end
end

if ARGV.length != 2
  puts "Usage: ruby roman_converter.rb <action> <input>"
  puts "Action: to_roman, to_integer"
else
  action, input = ARGV

  converter = RomanConverter.new

  case action
  when 'to_roman'
    puts converter.to_roman(input.to_i)
  when 'to_integer'
    puts converter.to_integer(input)
  else
    puts "Invalid action. Please use 'to_roman' or 'to_integer'."
  end
end

