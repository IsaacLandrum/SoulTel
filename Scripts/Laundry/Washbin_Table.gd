extends "res://Scripts/interactable.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func interact():
	if (currentAction == "TAKE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "00")
		pass # TAKE
	elif (currentAction == "TALK"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "01")
		pass # TALK
	elif (currentAction == "EXAMINE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "02")
		pass # examine
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		pass# USE 
	elif (currentAction == "TRAVERSE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "04")
		pass
