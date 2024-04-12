extends "res://Scripts/interactable.gd"

signal clerk_talk

func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx()
		pass # TAKE
		
	elif (currentAction == "TALK"):
		print("Talks to clerk")
		emit_signal("clerk_talk")
		pass # TALK

	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx()
		
		pass # USE
	elif (currentAction == "TRAVERSE"):
		SoundManager.play_error_sfx()
		pass
