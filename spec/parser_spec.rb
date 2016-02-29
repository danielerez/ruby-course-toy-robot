require './lib/parser'
require './lib/board'

describe Parser do
  before do
    @parser = Parser.new(Board.new(5, 5))
  end

  it "initializes the parser" do
    expect {
      Parser.new(Board.new(5, 5))
      }.not_to raise_error
  end

  it "pass an appropriate command" do
    expect {
      @parser.parse('PLACE 0,0,NORTH')
    }.not_to raise_error
  end

  it "pass an inappropriate command" do
    expect {
      @parser.parse('GOWEST')
    }.to raise_error 'Invalid command: GOWEST'
  end

  it "execute command before the robot is placed" do
    expect {
      @parser.parse('LEFT')
    }.to raise_error 'Robot is not placed yet!'
  end

end
