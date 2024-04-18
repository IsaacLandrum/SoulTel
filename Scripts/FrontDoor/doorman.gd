extends "res://Scripts/interactable.gd"

signal doorman_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
	elif (currentAction == "TALK"):
		print("DOORMAN TALK")
		emit_signal("doorman_complete")
		DialogOut.emit(CharacterID, "01")
		pass#TALK 
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")

