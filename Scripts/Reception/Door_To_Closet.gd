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
		if(GameManager.puzzle3.conditions.clothesWorn):
			print("Traversing to Closet")
			SceneTransition.changeGameScene("res://Scenes/Closet.tscn")
		else:
			print("EMPLOYEES ONLY YOU CANNOT PASS")
			DialogOut.emit(CharacterID, "04")
			
