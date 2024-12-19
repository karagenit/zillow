require 'csv'
require 'net/http'
require 'uri'
require 'json'

output_data = CSV.read('output.csv')

API_KEY = File.read('walkscore-api.key').strip

output_data[1..-1].each_with_index do |row, i|
  print "\rProgress: #{i+1}/#{output_data.length-1}"
  address = row[1]
  lat = row[6]
  lng = row[7]
  
  uri = URI("https://api.walkscore.com/score")
  params = {
    format: 'json',
    address: address,
    lat: lat,
    lon: lng,
    transit: 1,
    bike: 1,
    wsapikey: API_KEY
  }
  
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get(uri)
  begin
    walk_score_data = JSON.parse(response)
  rescue JSON::ParserError
    next
  end
  
  row << walk_score_data['walkscore']
  row << walk_score_data.dig('transit', 'score')
end

# Write the updated data back to CSV
CSV.open('output.csv', 'w') do |csv|
    output_data.each do |row|
      csv << row
    end
end