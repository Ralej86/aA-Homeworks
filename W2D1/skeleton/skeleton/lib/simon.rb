class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(seq.length)
    system("clear")
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each {|color| puts color}
  end

  def require_sequence
    puts "Enter the previous sequence of colors.  You can use the
          first letter if you'd like."
    @seq.each do |color|
      user_input = gets.chomp
      if color[0] != user_input[0].downcase
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message(*args)
    p "Nice job, here's the next sequence"
  end

  def game_over_message
    p "Sorry,you lose!"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
