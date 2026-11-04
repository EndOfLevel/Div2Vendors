require "yaml"
require "fileutils"

files = Dir.glob("_data/vendors_split/*.yml").sort
abort "No vendor files found in _data/vendors_split/" if files.empty?

items = []

files.each do |file|
  data = YAML.load_file(file)
  abort "#{file} must contain a YAML list" unless data.is_a?(Array)

  items.concat(data)
  puts "Loaded #{data.size} items from #{file}"
end

FileUtils.mkdir_p("_data")
File.write("_data/items.yml", YAML.dump(items))
puts "Wrote #{items.size} items to _data/items.yml"
