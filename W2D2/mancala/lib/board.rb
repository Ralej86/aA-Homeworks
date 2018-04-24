class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    4.times do |round|
      @cups.each_with_index do |arr, idx|
        arr << :stone unless idx == 6 || idx == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 12
    raise "invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = cups[start_pos].length
    j = start_pos
    @cups[start_pos] = []

    while i > 0
      j += 1
      j = 0 if j > 13
      if j == 6
        if current_player_name == @name1
          @cups[6] << :stone
          i -= 1
        end
      elsif j == 13
        if current_player_name == @name2
          @cups[13] << :stone
          i -=1
        end
      else
        @cups[j] << :stone
        i -= 1
      end
    end

    render
    next_turn(j)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left = @cups[0..5]
    right = @cups[7..12]
    left.all? { |cup| cup_is_empty?(cup) } ||
    right.all? { |cup| cup_is_empty?(cup) }
  end

  def cup_is_empty?(arr)
    arr.each { |el| return false unless el.empty?}
    true
  end

  def winner
    score1 = @cups[6].length
    score2 = @cups[13].length

    if score1 == score2
      :draw
    else
      score1 > score2 ? @name1 : @name2
    end
  end
end
