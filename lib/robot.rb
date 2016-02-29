require './lib/board'
require './lib/parser'

class Robot
  def initialize()
    puts "Welcome to Toy Robot Simulator"

    @board = Board.new(5, 5)
    @parser = Parser.new(@board)
  end

  def execute(commands_file)
    File.readlines(commands_file).each do |cmd|
      print 'Command: %s' % cmd
      begin
        method = @parser.parse(cmd)
        send(*method)
      rescue ArgumentError
        # silently ignore
      end
    end
  end

  def place(x_pos, y_pos, f)
    @board.place(x_pos, y_pos, f)
  end

  def report()
    puts @board.to_str
    @board.to_str
  end

  def move()
    x = @board.x_pos
    y = @board.y_pos
    f = @board.direction.to_s

    case f
      when 'NORTH'
        y += 1
      when 'SOUTH'
        y -= 1
      when 'EAST'
        x += 1
      when 'WEST'
        x -= 1
      else
    end

    @board.place(x, y, f)
  end

  def left()
    @board.f_index -= 1 % Board::DIRECTIONS.size
  end

  def right()
    @board.f_index += 1 % Board::DIRECTIONS.size
  end
end
