require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "Brie" do

      it "increases in quality each day" do
        context "*1 when sell in > 0" do

        end
        context "*2 when sell in <= 0" do

        end
      end
      it "has a maximum quality of 50" do

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
