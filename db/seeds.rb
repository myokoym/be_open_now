require "yaml"
require "ostruct"

shops = YAML.load(File.read("../be_open_now-data/toshima.yaml"))
shops.each do |shop_hash|
  shop = OpenStruct.new(shop_hash)
  Shop.create({
                name: shop.name,
                address: shop.address,
                weekday_opening_time: shop.weekday["opening_time"],
                weekday_closing_time: shop.weekday["closing_time"],
                weekday_opening_time2: shop.weekday["opening_time2"],
                weekday_closing_time2: shop.weekday["closing_time2"],
                saturday_opening_time: shop.saturday["opening_time"],
                saturday_closing_time: shop.saturday["closing_time"],
                saturday_opening_time2: shop.saturday["opening_time2"],
                saturday_closing_time2: shop.saturday["closing_time2"],
                sunday_opening_time: shop.sunday["opening_time"],
                sunday_closing_time: shop.sunday["closing_time"],
                holidays: shop.holidays,
                tags: shop.tags.join(","),
                description: shop.description,
              })
end
