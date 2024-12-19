response1 = File.read('response1.html')
list_results_index = response1.index('"listResults"')
bracket_count = 1
current_index = list_results_index + 16
while bracket_count > 0 and response1[current_index] != nil
  print "\r#{current_index}/#{response1.size}"

  char = response1[current_index]
  
  if char == '['
    bracket_count += 1
  elsif char == ']'
    bracket_count -= 1
  end
  
  current_index += 1
end
list_results = response1[list_results_index..current_index-1]

puts list_results[0..29]
puts list_results[-30..-1]

