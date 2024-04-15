extends "res://Scripts/interactable.gd"

#from Dialoge readme
#6 each interaction has an assigned dialoge offset
#6.1 Take is assigned the offset of 0.
#6.2 talk is assigned the offset of 1
#6.3 Examine is assigned the offset of 2
#6.4 USE is assigned the offset of 3
#6.5 Traverse is assigned the offset of 4
func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx() # TAKE
		DialogOut.emit(CharacterID, "00")
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		print("TALKING TO DOOR")
		DialogOut.emit(CharacterID, "01")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx() # USE
	elif (currentAction == "TRAVERSE"):
		print("Traversing to lobby")
		DialogOut.emit(CharacterID, "04")
		SceneTransition.changeScene("res://Scenes/Room3.tscn")
