extends "res://Scripts/interactable.gd"

signal attempt_open()

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
		if Inventory.selected_item == "Key":
			print("Door has been unlocked")
			GameManager.puzzle2.keyUsed = true
		pass # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		if is_key_used():  # Safe checking of keyUsed
			SceneTransition.changeGameScene("res://Scenes/GuestRoom1.tscn")
		else:
			print("Door is locked")
			SoundManager.play_error_sfx()
		
func is_key_used():
	# Safely check if keyUsed is true in GameManager.puzzle2
	if 'puzzle2' in GameManager and 'keyUsed' in GameManager.puzzle2:
		return GameManager.puzzle2['keyUsed']
	else:
		print("Error: Puzzle2 or keyUsed not properly initialized")
		return false	
		
		
