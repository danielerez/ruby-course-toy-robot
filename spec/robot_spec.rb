require './lib/robot'

describe Robot do
  before do
    @robot = Robot.new
    @robot.place(1, 1, :NORTH)
  end

  it "initializes the robot" do
    expect {
      Robot.new
      }.not_to raise_error
  end

  it "report location" do
    expect(@robot.report).to eq("1,1,NORTH")
  end

  it "move one step" do
    @robot.move
    expect(@robot.report).to eq("1,2,NORTH")
  end

  it "rotate left" do
    @robot.left
    expect(@robot.report).to eq("1,1,WEST")
  end

  it "rotate right" do
    @robot.right
    expect(@robot.report).to eq("1,1,EAST")
  end

end
