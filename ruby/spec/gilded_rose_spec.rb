require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
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
