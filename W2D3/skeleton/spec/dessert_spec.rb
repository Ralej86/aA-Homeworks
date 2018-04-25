require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cake) { Dessert.new('cake', 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { cake.quantity('50') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients).to_not include('frosting')
      cake.add_ingredient('frosting')
      expect(cake.ingredients).to include('frosting')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['flour', 'egg', 'frosting']

      ingredients.each do |el|
        cake.add_ingredient(el)
      end

      expect(cake.ingredients).to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.quantity).to eq(50)
      cake.eat(10)
      expect(cake.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(80) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef")
      expect(cake.serve).to eq("Chef has made 50 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
