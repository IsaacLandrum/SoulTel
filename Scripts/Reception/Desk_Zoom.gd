extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx()
		pass # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		print("TALKING")
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx()
		pass # USE
	elif (currentAction == "TRAVERSE"):
		print("Traversing to zoom")
	
		SceneTransition.changeScene("res://Scenes/Room2_DeskZoom.tscn")
