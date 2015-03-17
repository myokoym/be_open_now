require "yaml"
require "ostruct"

def add(bithour, first_time, last_time, wday)
  return unless first_time
  first_hour = first_time.split(":")[0].to_i
  last_hour = last_time.split(":")[0].to_i - 1
  first_hour.upto(last_hour) do |hour|
    bithour[24 * wday + hour] = "1"
  end
end

shops = YAML.load(File.read("../be_open_now-data/toshima.yaml"))
shops.each do |shop_hash|
  shop = OpenStruct.new(shop_hash)
  bithour = "0" * (24 * 7)

  1.upto(5) do |wday|
    add(bithour,
        shop.weekday["opening_time"],
        shop.weekday["closing_time"],
        wday)

    if shop.weekday["opening_time2"] && shop.weekday["closing_time2"]
      add(bithour,
          shop.weekday["opening_time"],
          shop.weekday["closing_time"],
          wday)
    end
  end

  add(bithour,
      shop.saturday["opening_time"],
      shop.saturday["closing_time"],
      6)
  if shop.saturday["opening_time2"] && shop.saturday["closing_time2"]
    add(bithour,
        shop.saturday["opening_time2"],
        shop.saturday["closing_time2"],
        6)
  end

  add(bithour,
      shop.sunday["opening_time"],
      shop.sunday["closing_time"],
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
