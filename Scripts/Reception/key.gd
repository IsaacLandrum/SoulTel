extends "res://Scripts/interactable.gd"

signal key_pickup

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		emit_signal("key_pickup")
		pass # TAKE
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID, "01")
		print("KEY TALKS")
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		 # USE
	elif (currentAction == "TRAVERSE"&&canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")
