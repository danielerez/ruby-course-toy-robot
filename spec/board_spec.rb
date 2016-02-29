require './lib/board'

describe Board do
  before do
    @board = Board.new(5, 5)
  end

  it "initializes the board with dimensions" do
    expect {
      Board.new(5, 5)
      }.not_to raise_error
  end

  it "place robot at an appropriate location" do
    @board.place(1,2,:NORTH)
    expect(@board.to_str).to eq("1,2,NORTH")
  end

  it "place robot at an inappropriate X" do
    expect {
      @board.place(7,2,:NORTH)
      }.to raise_error 'Position out of bounds'
  end

  it "place robot at an inappropriate Y" do
    expect {
      @board.place(4,-3,:NORTH)
      }.to raise_error 'Position out of bounds'
  end

end
