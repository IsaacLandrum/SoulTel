extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx() # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		print("TALKING TO DOOR")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx() # USE
	elif (currentAction == "TRAVERSE"):
		print("Traversing to lobby")
		SceneTransition.changeScene("res://Scenes/Room3.tscn")
