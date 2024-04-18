extends "res://Scripts/interactable.gd"

signal open_complete()

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
		pass # TAKE
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID, "01")
		SoundManager.play_error_sfx()
		print("TALKING")
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		
		pass # examine
	elif (currentAction == "USE"):
		if Inventory.selected_item.name == "Key":
			print("Door has been unlocked")
			GameManager.puzzle2.keyUsed = true
			open_complete.emit()
		pass # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		if GameManager.puzzle2.keyUsed == true:
			SceneTransition.changeGameScene("res://Scenes/GuestRoom1.tscn")
		else:
			print("Door is locked")
			SoundManager.play_error_sfx()
		
		
		
		
