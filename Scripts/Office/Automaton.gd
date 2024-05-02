extends "res://Scripts/interactable.gd"

@onready var UI = $"../Early_UI"

var paper_writing_info = {
	"name": "Paper_Writing",
	"icon_path": "res://Assets/Office/paper writing.png"
}

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID,"00")
		pass
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID,"01")
		pass
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID,"02")
		pass
	elif currentAction == "USE":
		DialogOut.emit(CharacterID,"03")
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID,"04")
		SceneTransition.changeGameScene("res://Scenes/Automaton_Zoom.tscn")
