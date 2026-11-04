require "yaml"
require "fileutils"

files = Dir.glob("_data/vendors_split/*.yml").sort
abort "No vendor files found in _data/vendors_split/" if files.empty?

puts "Files: #{files.inspect}"

vendors = []

files.each do |file|
  data = YAML.load_file(file)
  abort "#{file} must contain a YAML list" unless data.is_a?(Array)

  vendors.concat(data)
  puts "Loaded #{data.size} vendors from #{file}"
end

FileUtils.mkdir_p("_data")
File.write("_data/vendors.yml", YAML.dump(vendors))

puts "Wrote #{vendors.size} vendors to _data/vendors.yml"
puts File.read("_data/vendors.yml").lines.first(30)