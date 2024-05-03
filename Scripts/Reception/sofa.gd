extends "res://Scripts/interactable.gd"

func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "00")
		pass # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "01")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "02")
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		pass# USE 
	elif (currentAction == "TRAVERSE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "04")
		pass
