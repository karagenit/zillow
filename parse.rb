require 'strscan'
response1 = File.read('response1.html')
scanner = StringScanner.new(response1)
scanner.skip_until(/"listResults":\s*\[/)
start_pos = scanner.pos - 40
bracket_count = 1
while bracket_count > 0
  case scanner.scan(/[^\[\]]+|\[|\]/)
  when '['
    bracket_count += 1
  when ']'
    bracket_count -= 1
  end
end
list_results = response1[start_pos..scanner.pos-1]
# list_results.gsub!(/\s+/, '')
list_results.strip!
list_results.chop!
list_results = "{#{list_results}}"

require 'json'
parsed_results = JSON.parse(list_results)
puts parsed_results["listResults"].size

parsed_results["listResults"].each do |result|
  puts result["address"]
end


# puts "Start: '#{list_results[0..100]}'"
# puts "End: '#{list_results[-100..-1]}'"
# puts list_results.size