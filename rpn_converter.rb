def infix_to_rpn(expression)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }

  output = []
  operator_stack = []

  tokens = expression.scan(/\d+|\+|\-|\*|\//)

  tokens.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token == '('
      operator_stack.push(token)
    elsif token == ')'
      output << operator_stack.pop until operator_stack.empty? || operator_stack.last == '('
      operator_stack.pop if operator_stack.last == '('
    else
      while !operator_stack.empty? && precedence[token] <= precedence[operator_stack.last]
        output << operator_stack.pop
      end
      operator_stack.push(token)
    end
  end

  output.concat(operator_stack.reverse)
end

if ARGV.length != 1
  puts "Usage: ruby rpn_converter.rb <math_expression>"
else
  math_expression = ARGV[0]
  rpn_expression = infix_to_rpn(math_expression).join(' ')
  puts "Input: #{math_expression}"
  puts "RPN: #{rpn_expression}"
end
