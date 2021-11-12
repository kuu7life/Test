require_relative './file_parser.rb'

parser = FileParser.new(ARGV[0])
parser.parse

File.open("result.txt", "w") do |line|
  line.write("list of webpages with most page views ordered from most pages views to less page views\n===================================\n")
for k,v in parser.most_views
  line.write(k+"  :  ", v.to_s+"\n")
end
line.write("\n\list of webpages with most unique page views (ordered)\n===================================\n")
for k,v in parser.unique_views
  line.write(k+"  :  ", v.to_s+"\n")
end
end

puts "Created file \"result.txt\""
