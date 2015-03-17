require "yaml"
require "ostruct"

def add(bithour, open_times, wday)
  return unless open_times
  return if open_times.empty?
  open_times.split(/\s*,\s*/).each do |open_time|
    opening_time, closing_time = open_time.split("-")
    opening_hour = opening_time.split(":")[0].to_i
    closing_hour = closing_time.split(":")[0].to_i - 1
    opening_hour.upto(closing_hour) do |hour|
      bithour[24 * wday + hour] = "1"
    end
  end
end

shops = YAML.load(File.read("../be_open_now-data/toshima.yaml"))
shops.each do |shop_hash|
  shop = OpenStruct.new(shop_hash)
  bithour = "0" * (24 * 7)

  1.upto(5) do |wday|
    add(bithour,
        shop.weekday,
        wday)
  end

  add(bithour,
      shop.saturday,
      6)

  add(bithour,
      shop.sunday,
      0)

  shop = OpenStruct.new(shop_hash)
  Shop.create({
                name: shop.name,
                address: shop.address,
                bithour: bithour,
                tags: shop.tags.join(","),
                description: shop.description,
              })
end
