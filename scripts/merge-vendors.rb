require "yaml"
require "fileutils"

merged = {}

Dir.glob("_data/vendors/*.yml").sort.each do |file|
  items = YAML.load_file(file) || {}

  duplicate_ids = merged.keys & items.keys
  abort "Duplicate item IDs in #{file}: #{duplicate_ids.join(', ')}" unless duplicate_ids.empty?

  merged.merge!(items)
end

File.write("_data/vendors.yml", YAML.dump(merged))
