extends "res://Scripts/interactable.gd"

var Dialog_State = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	print(canTraverse)
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
	elif (currentAction == "TALK"):
		print("TALKING")
		DialogOut.emit(CharacterID, "01")
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
	elif (currentAction == "USE"):
		if Dialog_State:
			DialogOut.emit(CharacterID, "08")
		else:
			DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
	elif (currentAction == "TRAVERSE" && canTraverse):
		if Dialog_State:
			DialogOut.emit(CharacterID, "09")
			print("Traversing")
			SoundManager.play_lobby_music()
			SceneTransition.changeGameScene(traverse_path)
		else:
			DialogOut.emit(CharacterID, "04")


func DialogeHandler():
	Dialog_State = true
