extends Area2D

signal action(message: String)

@onready var WheelIcon = $"../WheelIcon"

func _ready():
	# Set the input pickable property to true so it can receive input events
	input_pickable = true
	
	

func _on_examine_clicked(_viewport, event, _shape_idx):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Examine Selected")
		SoundManager.play_click_sound()
		WheelIcon.set_frame_and_progress(0,0)
		emit_signal("action", "EXAMINE")
		Inventory.clear_selected_item()
		
#Following section handles on hover effect		
func _on_mouse_entered():
	$ExamineHover.show()
func _on_mouse_exited():
	$ExamineHover.hide()

