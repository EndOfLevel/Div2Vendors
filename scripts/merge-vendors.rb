require "yaml"
require "fileutils"

files = Dir.glob("_data/vendors/*.yml").sort
abort "No vendor files found in _data/vendors/" if files.empty?

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
