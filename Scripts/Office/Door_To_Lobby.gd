extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		pass # TAKE
	elif (currentAction == "TALK"):
		print("TALKING TO DOOR")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		pass # USE
	elif (currentAction == "TRAVERSE"):
		print("Traversing to lobby")
		SceneTransition.changeScene("res://Scenes/Room3.tscn")
