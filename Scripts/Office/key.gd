extends "res://Scripts/interactable.gd"

signal key_pickup

#from Dialoge readme
#6 each interaction has an assigned dialoge offset
#6.1 Take is assigned the offset of 0.
#6.2 talk is assigned the offset of 1
#6.3 Examine is assigned the offset of 2
#6.4 USE is assigned the offset of 3
#6.5 Traverse is assigned the offset of 4
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
