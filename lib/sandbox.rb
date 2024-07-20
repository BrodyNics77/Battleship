require './lib/ship'
require './lib/cell'

cell = Cell.new("B4")
ship = Ship.new("Cruiser", 3)

p cell.fire_upon