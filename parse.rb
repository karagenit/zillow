require 'strscan'
require 'json'

apartments = []

Dir.glob("allResults/*.html").each do |file|
    response1 = File.read(file)
    scanner = StringScanner.new(response1)
    scanner.skip_until(/"listResults":\s*\[/)
    start_pos = response1.index('"listResults"')
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
    list_results.strip!
    list_results.chop! if list_results.end_with?(',')
    list_results = "{#{list_results}}"
    begin
        parsed_results = JSON.parse(list_results)
        apartments.concat(parsed_results["listResults"])
    rescue JSON::ParserError => e
        puts "Failed to parse JSON"
        puts "Start: '#{list_results[0..100]}'"
        puts "End: '#{list_results[-1000..-1]}'"
        puts list_results.size
        exit
    end
end

puts apartments.size

# apartments.each do |result|
#   puts result["address"]
# end


non_buildings = apartments.count { |apt| apt["isBuilding"] == false }
puts "Number of non-building apartments: #{non_buildings}"

total_availability = apartments.sum { |apt| apt["availabilityCount"].to_i }
puts "Total availability count: #{total_availability}"
