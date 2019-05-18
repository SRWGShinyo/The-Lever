extends Path2D

var goal := Vector2.INF
var speed: float = 0
const MAX_SPEED = 100

var last_go_there_angle_inf = 0
var last_go_there_angle_sup = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		go_right()
	if Input.is_action_just_pressed("ui_left"):
		go_left()
	if Input.is_action_just_pressed("ui_up"):
		go_up()
	if Input.is_action_just_pressed("ui_down"):
		go_down()
	
	if goal != Vector2.INF:
		print_debug((goal - $PathFollow2D.position).length())
		if (goal - $PathFollow2D.position).length() < 1:
			goal = Vector2.INF
			speed = 0
			# In order to repeat the movement until done
			go_there(last_go_there_angle_inf, last_go_there_angle_sup)

func _physics_process(delta):
	$PathFollow2D.offset += speed * delta

func go_right():
	go_there(-PI / 4, PI / 4)

func go_up():
	go_there(1 / 4 * PI, 3 / 4 * PI)

func go_left():
	go_there(3 / 4 * PI, 5 / 4 * PI)

func go_down():
	go_there(5 / 4 * PI, 7 / 4 * PI)


func go_there(angleInf: float, angleSup: float):
	angleInf = normalize_angle(angleInf)
	angleSup = normalize_angle(angleSup)
	
	var curve := get_curve()
	var points := curve.get_baked_points()
	
	var index := 0
	var current := curve.get_closest_point($PathFollow2D.position)
	for i in range(0, points.size()):
		if points[i] == current:
			index = i
	
	for i in get_adjacent_points(points.size(), index):
		var delta: Vector2 = points[i] - $PathFollow2D.position
		if contained(delta.angle(), angleInf, angleSup):
			speed = MAX_SPEED if i > index else -MAX_SPEED
			goal = points[i]
			last_go_there_angle_inf = angleInf
			last_go_there_angle_sup = angleSup

func normalize_angle(x: float) -> float:
	while x < 0:
		x += 2 * PI
	while x >= 2 * PI:
		x -= 2 * PI
	return x

func get_adjacent_points(size: int, index: int) -> Array:
	if size <= 1:
		return []
	elif index == 0:
		return [index + 1]
	elif index == size - 1:
		return [index - 1]
	else:
		return [index - 1, index + 1]

func contained(x: float, a: float, b: float) -> bool:
	if a < b:
		return x >= a and x <= b
	else:
		return x <= a or x >= b