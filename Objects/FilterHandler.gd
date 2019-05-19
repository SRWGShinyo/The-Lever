extends Node2D

var redNodes = null;
var blueNodes = null;
var greenNodes = null;

func _loadAndhide(grpID):
	if grpID == "Red":
		redNodes = get_tree().get_nodes_in_group("Red")
		for elem in redNodes:
			elem.set_process(false)
			elem.hide()
	
	if grpID == "Blue":
		blueNodes = get_tree().get_nodes_in_group("Blue")
		for elem in blueNodes:
			elem.set_process(false)
			elem.hide()
			
	if grpID == "Green":
		greenNodes = get_tree().get_nodes_in_group("Green")
		for elem in greenNodes:
			elem.set_process(false)
			elem.hide()

func _deactivateAll():
	for elem in greenNodes:
		elem.set_process(false)
		elem.hide()

	for elem in blueNodes:
		elem.set_process(false)
		elem.hide()
		
	for elem in redNodes:
		elem.set_process(false)
		elem.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if redNodes == null:
		_loadAndhide("Red")
	if greenNodes == null:
		_loadAndhide("Green")
	if blueNodes == null:
		_loadAndhide("Blue")

func changeFilter(filterName):
	_deactivateAll()
	if filterName == "Red":
		for elem in redNodes:
			elem.set_process(true)
			elem.show()

	if filterName == "Green":
		for elem in greenNodes:
			elem.set_process(true)
			elem.show()

	if filterName == "Blue":
		for elem in blueNodes:
			elem.set_process(true)
			elem.show()

func _on_ClickableArea_clicked():
	changeFilter("Black")

func _on_ClickableBlueArea_clicked():
	changeFilter("Blue")

func _on_ClickableRedArea_clicked():
	changeFilter("Red")
	
func _on_ClickableGreenArea_clicked():
	changeFilter("Green")
