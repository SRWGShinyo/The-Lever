extends Control

export var mx := 0
export var mn := -55

var audioMain: AudioStreamPlayer;
var audioLv1: AudioStreamPlayer;
var audioLv2: AudioStreamPlayer;

var musiclvl : float = 50;
var fxlvl : float = 50;
# Called when the node enters the scene tree for the first time.
func _ready():
	audioMain = get_node("Audit")
	audioLv1 = get_node("Level1")
	audioLv2 = get_node("Level2")
	
	audioMain.volume_db = _computeDB(50)
	audioLv1.volume_db = _computeDB(50)
	audioLv2.volume_db = _computeDB(50)

func _computeDB(valuetoSet : float):
	return valuetoSet * (mx - mn)/100 + mn

func changeMusicVolume():
	audioMain.volume_db = _computeDB(musiclvl)
	audioLv1.volume_db = _computeDB(musiclvl)
	audioLv2.volume_db = _computeDB(musiclvl)
	
func changeFxVolume():
	#FIXME: implement this for  any FX.
	pass