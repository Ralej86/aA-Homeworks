class Map
  def initialize
    @map = []
  end

  def assign(key, value) #assigns a unique key, value pair to the map
    @map.include?([key, value]) ? nil : @map << [key, value]
  end

  def lookup(key)
    @map.select {|arr| arr[0] == key}
  end

  def remove(key)
    @map.reject {|arr| arr[0] == key}
  end

  def show #must be a deep copy because of the nested arrays
    deep_dup(@map)
  end

  private
  def deep_dup(array)
    result = []
    array.each do |el|
      el.is_a?(Array) ? result << deep_dup(el) : result << el
    end
    result
  end
end


my_map = Map.new
my_map.assign("red", true)
my_map.assign("red", true) #should not be assigned since it already exists
my_map.assign(1, true)
p my_map.show #returns [["red", true],[1,true]]
