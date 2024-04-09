extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		pass # TAKE
	elif (currentAction == "TALK"):
		print("TALKING")
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		pass # USE
	elif (currentAction == "TRAVERSE"):
		print("Traversing to zoom")
	
		get_tree().change_scene_to_file("res://Scenes/Room2_DeskZoom.tscn")
