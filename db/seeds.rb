require "yaml"

shops = YAML.load(File.read("../be_open_now-data/toshima.yaml"))
shops.each do |shop|
  Shop.create(shop)
end
