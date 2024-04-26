extends "res://Scripts/interactable.gd"

signal clerk_talk
@onready var Next_label = $"../Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"
func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
		pass # TAKE
		
	elif (currentAction == "TALK"):
		await DialogOut.emit(CharacterID, "01")
		print("Talks to clerk")
		emit_signal("clerk_talk")
		Next_label.visible = true
		if(!done):
			waiting = true
		pass#talk

	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		
		pass # USE
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID, "04")
		SoundManager.play_error_sfx()
		pass
		
