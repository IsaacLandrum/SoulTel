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
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "00")
		pass # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		print("TALKING")
		DialogOut.emit(CharacterID, "01")	#emits the error signal to the dialoge
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass # examine
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "03")
		pass # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		print("Traversing to zoom")
	
		SceneTransition.changeScene("res://Scenes/Room2_DeskZoom.tscn")
