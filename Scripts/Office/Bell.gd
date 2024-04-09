extends "res://Scripts/interactable.gd"

signal bell_rung

func interact():
	if (currentAction == "TAKE"):
		pass # TAKE
	elif (currentAction == "TALK"):
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		print("USE BELL")
		emit_signal("bell_rung")
		
		pass # USE
	elif (currentAction == "TRAVERSE"):
		pass
