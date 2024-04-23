extends "res://Scripts/interactable.gd"


func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx() # TAKE
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID, "01")
		SoundManager.play_error_sfx()
		print("TALKING TO DOOR")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx() # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		print("Traversing to Closet")
		SceneTransition.changeGameScene("res://Scenes/Closet.tscn")
