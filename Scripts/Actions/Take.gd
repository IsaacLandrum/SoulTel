extends Area2D

signal action(message: String)

func _ready():
	# Set the input pickable property to true so it can receive input events
	input_pickable = true

func _on_take_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("action", "TAKE")		

#Following section handles on hover effect		
func _on_mouse_entered():
	$TakeHover.show()
func _on_mouse_exited():
	$TakeHover.hide()
