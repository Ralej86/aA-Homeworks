require 'rspec'
require 'lru_cache'

RSpec.describe do
  describe 'Least Recently Used Cache' do
    subject(:lru) {LRUCache.new(4)}

    describe "#initialize" do
      it "creates an empty array with a certain size" do
        expect(lru.show).to eq(Array.new(4, nil))
      end
    end

    describe "#count" do
      it "shows the size of the cache (without nil)" do
        expect(lru.count).to eq(0)
      end
    end
  end
end
