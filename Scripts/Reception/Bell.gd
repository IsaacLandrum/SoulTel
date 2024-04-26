extends "res://Scripts/interactable.gd"

signal bell_rung
var first_time = true

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
		pass # TAKE
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID, "01")
		SoundManager.play_error_sfx()
		
		pass # TALK
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		print("USE BELL")
		$bell_ding.play()
		if first_time:
			SoundManager.play_long_steps()
			first_time = false
			
		await get_tree().create_timer(1.8).timeout

		emit_signal("bell_rung")
		
		pass # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		SoundManager.play_error_sfx()
		pass
