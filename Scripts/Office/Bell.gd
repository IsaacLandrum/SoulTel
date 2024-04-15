extends "res://Scripts/interactable.gd"

signal bell_rung

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
