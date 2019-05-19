extends Node2D

var brickLeft = []
var brickRight = []

func _ready():
	brickLeft.append($Line1/Left1)
	brickLeft.append($Line2/Left2)
	brickLeft.append($Line3/Left3)
	
	brickRight.append($Line1/Right1)
	brickRight.append($Line2/Right2)
	brickRight.append($Line3/Right3)
	
func destroyRoof():
	for elem in brickLeft:
		elem.brk()
	
	for elem in brickRight:
		elem.brkr()