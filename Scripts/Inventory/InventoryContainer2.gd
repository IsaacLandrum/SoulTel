extends Area2D

signal container(number: int)


@onready var WheelIcon = $"../WheelIcon"

func _ready():
	# Set the input pickable property to true so it can receive input events
	input_pickable = true

func _on_container_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Container2 selected")
		SoundManager.play_click_sound()
		container.emit(2)


#Following section handles on hover effect
func _on_mouse_entered():
	pass
	#$TraverseHover.show()	
func _on_mouse_exited():
	pass
	#$TraverseHover.hide()
