require './lib/robot'

puts "Welcome to Toy Robot Simulator"

robot = Robot.new
robot.execute('./res/commands.txt')