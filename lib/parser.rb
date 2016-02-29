class Parser
  COMMANDS = [:PLACE, :MOVE, :REPORT, :LEFT, :RIGHT]

  def initialize(board)
    @board = board
  end

  def parse(cmd)
    cmd_arr = cmd.split(' ')
    command = cmd_arr[0]
    args = cmd_arr[1]

    validate_command(command)
    args ? [command.downcase] + args.split(',') : [command.downcase]
  end

  private
  def validate_command(command)
    if command == nil || COMMANDS.index(command.to_sym) == nil
      raise ArgumentError.new('Invalid command: %s' % command)
    end
    if command != 'PLACE' && !@board.placed?
      raise ArgumentError.new('Robot is not placed yet!')
    end
  end
end
