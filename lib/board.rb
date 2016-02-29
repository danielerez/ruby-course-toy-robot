class Board
  DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST]

  attr_accessor :x_pos
  attr_accessor :y_pos
  attr_accessor :f_index

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def place(x_pos, y_pos, f)
    x_pos = validate_pos(x_pos, @x_size)
    y_pos = validate_pos(y_pos, @y_size)
    f_index = validate_f(f)

    @x_pos = x_pos
    @y_pos = y_pos
    @f_index = f_index

    @initialized = true
  end

  def initialized?
    @initialized
  end

  def direction()
    DIRECTIONS[@f_index]
  end

  def to_str()
    "%d,%d,%s" % [@x_pos, @y_pos, DIRECTIONS[@f_index]]
  end


  private
  def validate_pos(pos, size)
    pos_int = Integer pos
    if pos_int.to_i < 0 || pos_int.to_i > size
      raise ArgumentError.new('Position out of bounds')
    end
    pos_int
  end

  def validate_f(f)
    f_index = DIRECTIONS.index(f.to_sym)
    if f_index == nil
      raise ArgumentError.new('Invalid f %s: ' % f)
    end
    f_index
  end

end
