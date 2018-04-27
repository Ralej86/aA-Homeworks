class LRUCache
  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    @cache.compact.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache << el
    end
    @cache.shift if @cache.count >= 5
    el
  end

  def show
    print @cache
    @cache
  end

  private
  def to_s
    @cache
  end

end

arr = LRUCache.new(4)

p arr.add("I walk the line")
p arr.add(5)
p arr.count # => returns 2
p arr.add([1,2,3])
p arr.add(5)
p arr.add(-5)
p arr.add({a: 1, b: 2, c: 3})
p arr.add([1,2,3,4])
p arr.add("I walk the line")
p arr.add(:ring_of_fire)
p arr.add("I walk the line")
p arr.add({a: 1, b: 2, c: 3})
arr.show
