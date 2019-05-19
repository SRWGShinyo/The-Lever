extends Control

var audioMain;
var audioLv1;
var audioLv2;
# Called when the node enters the scene tree for the first time.
func _ready():
	audioMain = get_node("Audit")
	audioLv1 = get_node("Level1")
	audioLv2 = get_node("Level2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
