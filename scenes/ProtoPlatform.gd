extends Path2D

var graph: MyGraph = null

func _enter_tree():
	graph = MyGraph.new()
	var curve := self.get_curve()
	for i in curve.get_point_count():
		graph.add_linked_node(curve.get_point_position(i))

var goal := Vector2.INF
var speed: float = 0
const MAX_SPEED = 100

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

func _physics_process(delta):
	$PathFollow2D.offset += speed * delta

func go_right():
	go_there(-PI / 4, PI / 4)

func go_up():
	go_there(5.0 / 4 * PI, 7.0 / 4 * PI)

func go_left():
	go_there(3.0 / 4 * PI, 5.0 / 4 * PI)

func go_down():
	go_there(1.0 / 4 * PI, 3.0 / 4 * PI)


func go_there(angleInf: float, angleSup: float):
	angleInf = normalize_angle(angleInf)
	angleSup = normalize_angle(angleSup)

	var points: Array = graph.get_neighbors($PathFollow2D.position)

	for p in points:
		var delta: Vector2 = p - $PathFollow2D.position
		if contained(delta.angle(), angleInf, angleSup):
			speed = MAX_SPEED
			self.set_curve(create_curve($PathFollow2D.position, p))
			$PathFollow2D.offset = 0

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