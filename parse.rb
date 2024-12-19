require 'strscan'
require 'json'

def parse_apartments(dirname)
    apartments = []
    Dir.glob("#{dirname}/*.html").each do |file|
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
    apartments
end

all_apts = parse_apartments('allResults')
complex_apts = parse_apartments('aptComplexes')
indie_apts = all_apts.reject { |apt| complex_apts.any? { |complex| complex["id"] == apt["id"] } }

require 'csv'

CSV.open('output.csv', 'w') do |csv|
  csv << ['detailUrl', 'address', 'unformattedPrice', 'beds', 'baths', 'area']  # Header row
  indie_apts.each do |apt|
    csv << [apt['detailUrl'], apt['address'], apt['unformattedPrice'], apt['beds'], apt['baths'], apt['area']]
  end
end
