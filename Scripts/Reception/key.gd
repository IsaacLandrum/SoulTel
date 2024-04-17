extends "res://Scripts/interactable.gd"

signal key_pickup

func interact():
	if (currentAction == "TAKE"):
		emit_signal("key_pickup")
		pass # TAKE
	elif (currentAction == "TALK"):
		print("KEY TALKS")
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx()
		 # USE
	elif (currentAction == "TRAVERSE"&&canTraverse):
		print("Traversing")
