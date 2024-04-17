extends "res://Scripts/interactable.gd"

signal bell_rung

func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx()
		pass # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		print("USE BELL")
		$bell_ding.play()
		await get_tree().create_timer(5.0).timeout
		emit_signal("bell_rung")
		
		pass # USE
	elif (currentAction == "TRAVERSE"):
		SoundManager.play_error_sfx()
		pass
