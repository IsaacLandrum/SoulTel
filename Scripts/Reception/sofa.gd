extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
	elif (currentAction == "TALK"):
		print("TALKING")
		DialogOut.emit(CharacterID, "01")
		if(!done):
			waiting = true
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")
		SoundManager.play_lobby_music()
		SceneTransition.changeGameScene(traverse_path)

func _input(event):
	#print("In _input")
	# Mouse in viewport coordinates.
	if not waiting:
		if Input.is_action_pressed("mouse_click") && isHovering:
			print("click")
			interact() #takes action based on what action is selected
	elif Input.is_anything_pressed() && not Input.is_action_pressed("mouse_click"):
		talkUpper()
