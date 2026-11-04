require "yaml"
require "fileutils"

files = Dir.glob("_data/items/*.yml").sort
abort "No item files found in _data/items/" if files.empty?

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
