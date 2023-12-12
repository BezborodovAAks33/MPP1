def valid_ipv4?(ip)
  octets = ip.split('.')

  return false unless octets.length == 4

  octets.each do |octet|
    return false unless octet.match?(/^\d+$/) && !octet.match?(/\s/)
    value = octet.to_i
    return false unless (0..255).cover?(value)
    return false unless octet.to_i.to_s == octet && (octet == '0' || !octet.start_with?('0'))
    return false unless octet.length.between?(1, 3)
  end

  true
end

# Приклад використання
ip_address = ARGV[0]
puts valid_ipv4?(ip_address)
