class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"

      if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.quality < 50
        item.quality = item.quality + 1
        item.quality += 1 if item.sell_in < 11 && item.quality < 50
        item.quality += 1 if item.sell_in < 6 && item.quality < 50
      end

      item.quality += 1 if item.name == "Aged Brie" && item.quality < 50

      item.quality -= 1 if item.quality > 0 && (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")

      item.sell_in = item.sell_in - 1

      item.quality += 1 if item.name == "Aged Brie" && item.quality < 50 && item.sell_in < 0
      
      item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 0
      
      if item.sell_in < 0
        unless item.name == "Aged Brie"
          if item.quality > 0
              item.quality = item.quality - 1
          end
        end
      end

    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
