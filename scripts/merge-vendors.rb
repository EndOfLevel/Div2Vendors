require "yaml"
require "fileutils"

merged = {}

Dir.glob("_data/vendors_split/*.yml").sort.each do |file|
  vendors = YAML.load_file(file) || {}

  duplicate_ids = merged.keys & vendors.keys
  abort "Duplicate vendor IDs in #{file}: #{duplicate_ids.join(', ')}" unless duplicate_ids.empty?

  merged.merge!(vendors)
end

File.write("_data/vendors.yml", YAML.dump(merged))