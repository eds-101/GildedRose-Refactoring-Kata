require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "Brie" do

      describe "increases in quality each day" do
        context "+1 whilst sell in is positive" do

        end
        context "+2 when sell in is 0 or less" do

        end
      end
      it "has a maximum quality score of 50" do

      end

    end


    describe "Backstage passes" do
      it "increases in quality each day" do
        @items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 13, 5)]
        GildedRose.new(@items).update_quality()
        expect(@items[0].quality).to eq 6
        GildedRose.new(@items).update_quality()
        expect(@items[0].quality).to eq 7
      end
      describe "when concert date is close" do
        it "increases quality by 2 for 10-6 days out" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 8)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 10
        end
        it "increases quality by 3 for 5-0 days out" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 13
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 16
        end
        it "loses all quality once concert passes" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 100)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

      end

    end

    describe "Sulfuras" do
      before(:all) do
        @items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        5.times { GildedRose.new(@items).update_quality() }
      end
      it "maintains quality of 80" do
        expect(@items[0].quality).to eq 80
      end
      it "keeps initial sell_in value" do
        expect(@items[0].sell_in).to eq 5
      end
    end


  end

end
