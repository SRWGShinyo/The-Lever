extends Path2D

class_name Platform

signal just_arrived
signal crash

var graph: MyGraph = null

export var can_go_left := true
export var can_go_right := true
export var can_go_down := true
export var can_go_up := true

export var can_fall := false

var attached := true

var velocity = Vector2(0, 0)

var last_point := Vector2()

func moving() -> bool:
	return speed != 0

func _enter_tree():
	graph = MyGraph.new()
	var curve := self.get_curve()
	for i in curve.get_point_count():
		graph.add_linked_node(curve.get_point_position(i))
	last_point = curve.get_closest_point($PathFollow2D.position)

var goal := Vector2()
var speed: float = 0
const MAX_SPEED = 100

func _process(delta):

	if attached and moving():
		if (goal - $PathFollow2D.position).length() < 1:
			goal = Vector2()
			speed = 0
			last_point = $PathFollow2D.position
			emit_signal("just_arrived")

func _physics_process(delta):
	if attached:
		$PathFollow2D.offset += speed * delta
	else:
		velocity.y += 10
		velocity = $PathFollow2D/KinematicBody2D.move_and_slide(velocity, Vector2(0, -1))

func go_right():
	if can_go_right:
		return go_there(-PI / 4, PI / 4)
	return false

func go_up():
	if can_go_up:
		return go_there(5.0 / 4 * PI, 7.0 / 4 * PI)
	return false

func go_left():
	if can_go_left:
		return go_there(3.0 / 4 * PI, 5.0 / 4 * PI)
	return false

func go_down():
	if can_go_down:
		return go_there(1.0 / 4 * PI, 3.0 / 4 * PI)
	return false

func go_to_point(p):
	if not attached:
		return
	speed = MAX_SPEED
	self.set_curve(create_curve($PathFollow2D.position, p))
	$PathFollow2D.offset = 0
	goal = p

func go_there(angleInf: float, angleSup: float):
	if not attached:
		return false
	angleInf = normalize_angle(angleInf)
	angleSup = normalize_angle(angleSup)

	var points: Array = graph.get_neighbors($PathFollow2D.position)

	for p in points:
		var delta: Vector2 = p - $PathFollow2D.position
		if contained(delta.angle(), angleInf, angleSup):
			go_to_point(p)
			last_point = $PathFollow2D.position
			return true
	
	return false

func create_curve(source: Vector2, origin: Vector2) -> Curve2D:
	var curve := Curve2D.new()
	curve.add_point(source)
	curve.add_point(origin)
	return curve

func normalize_angle(x: float) -> float:
	while x < 0:
		x += 2 * PI
	while x >= 2 * PI:
		x -= 2 * PI
	return x

func contained(x: float, a: float, b: float) -> bool:
	x = normalize_angle(x)
	if a < b:
		return x >= a and x <= b
	else:
		return x >= a or x <= b

func _on_Area2D_body_entered(body):
	if body != $PathFollow2D/KinematicBody2D:
		go_to_point(last_point)
		emit_signal("crash")
		if can_fall:
			attached = false
