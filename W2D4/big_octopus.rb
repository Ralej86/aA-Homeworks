require 'byebug'

def sluggish_octopus(array)
  sorted = false

  until sorted
    sorted = true
    array.each_index do |i|
      j = i + 1
      next if array[j].nil?
      if array[i].length > array[j].length
        array[i], array[j] = array[j], array[i]
        sorted = false
      end
    end
  end

  array.last
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    midpoint = self.length / 2
    left = self.take(midpoint).merge_sort(&prc)
    right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant_octopus(fishes)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fishes.merge_sort(&prc).last
end

def clever_octopus(array)
  longest = array.first
  array.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end
  longest
end

def slow_dance(tile, tile_arr)
  tile_arr.each_index {|idx| return idx if tile == tile_arr[idx]}
end

def contest_dance(tile, tile_hash)
  tile_hash[tile]
end
