extends Node2D

var barks = []
var rng = RandomNumberGenerator.new()
var time = Timer.new()

func _playRandomBark():
	var toplay = rng.randi_range(0, len(barks) - 1)
	var audio = barks[toplay]
	audio.play()

func _ready():
	rng.randomize()
	barks.append(MainTitleMusic.bark1)
	barks.append(MainTitleMusic.bark2)
	barks.append(MainTitleMusic.bark3)


func _on_ClickableArea_clicked():
	if $Clickable/ClickableArea/AnimatedSprite.animation == "Idle":
		$Clickable/ClickableArea/AnimatedSprite.play("Pet")
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() == 0:
			return
		var player := players[0] as KinematicBody2D
		$Clickable/ClickableArea/AnimatedSprite.flip_h = player.position.x < position.x
		_playRandomBark()

func _on_AnimatedSprite_animation_finished():
	if $Clickable/ClickableArea/AnimatedSprite.animation == "Pet":
		$Clickable/ClickableArea/AnimatedSprite.play("Idle")