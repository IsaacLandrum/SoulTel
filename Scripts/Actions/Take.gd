extends Area2D

func _ready():
	# Set the input pickable property to true so it can receive input events
	input_pickable = true

func _on_take_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Take Selected")