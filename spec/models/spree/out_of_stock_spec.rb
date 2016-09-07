require 'spec_helper'

module::Spree
  RSpec.describe OutOfStock, type: :model do

    it "should start without out of stock products" do
        expect(OutOfStock.all).to be_empty
      end

    describe "when removing stocks" do
      it "should create a new out of stock record" do
        product = create(:product_in_stock)
        stock_item = StockItem.find_by variant_id: product.master.id
        stock_movement = create(:stock_movement, quantity: -1 * product.total_on_hand, stock_item: stock_item)
        expect(Variant.find(product.master.id).total_on_hand).to eq(0)
        expect(OutOfStock.last.variant_id).to eq(product.master.id)
      end

      it "with multiple variant should create a out of stock record of the corresponding variant" do
        product = create(:product)
        variants = []
        (1..3).each do |i|
          variants << create(:variant, product: product, sku: "VAR-#{i}")
        end
        variants.each do |variant|
          stock_item = StockItem.find_by variant_id: variant.id
          stock_movement = create(:stock_movement, quantity: -1 * variant.total_on_hand, stock_item: stock_item)
          expect(Variant.find(variant.id).total_on_hand).to eq(0)
          expect(OutOfStock.last.variant_id).to eq(variant.id)
        end
      end

      it "more than available should create a new out of stock record" do
        product = create(:product_in_stock)
        stock_item = StockItem.find_by variant_id: product.master.id
        stock_movement = create(:stock_movement, quantity: -1 * product.total_on_hand - 1, stock_item: stock_item)
        expect(OutOfStock.last.variant_id).to eq(product.master.id)
      end

    end

    describe "when buying all products available" do
    
      it "should create a new out of stock record" do
        product = create(:product_in_stock)
        line_item = create(:line_item, variant_id: product.master.id, quantity: product.total_on_hand)
        order = create(:order_ready_to_ship, line_items: [line_item] )
        order.finalize!
        expect(OutOfStock.find_by(variant_id: product.master.id).variant_id).to eq(product.master.id)
      end

    end

  end

end
