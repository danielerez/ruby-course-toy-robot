class Board
  DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST]

  attr_accessor :x_pos, :y_pos, :f_index

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def place(x_pos, y_pos, f)
    x_pos = validate_position(x_pos, @x_size)
    y_pos = validate_position(y_pos, @y_size)
    f_index = validate_f(f)

    @x_pos = x_pos
    @y_pos = y_pos
    @f_index = f_index

    @placed = true
  end

  def placed?
    @placed
  end

  def direction
    DIRECTIONS[@f_index]
  end

  def to_str()
    "%d,%d,%s" % [@x_pos, @y_pos, DIRECTIONS[@f_index]]
  end


  private
  def validate_position(position, size)
    position_int = Integer position
    if position_int.to_i < 0 || position_int.to_i > size
      raise ArgumentError.new('Position out of bounds')
    end
    position_int
  end

  def validate_f(f)
    f_index = DIRECTIONS.index(f.to_sym)
    if f_index == nil
      raise ArgumentError.new('Invalid f %s: ' % f)
    end
    f_index
  end

end
