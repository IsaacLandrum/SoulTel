extends "res://Scripts/interactable.gd"

signal paper_pickup

func interact():
	if (GameManager.puzzle3.conditions.ghostTalked):	
		if (currentAction == "TAKE"):
			DialogOut.emit(CharacterID,"00")
			emit_signal("paper_pickup")
		elif (currentAction == "TALK"):
			DialogOut.emit(CharacterID,"01")
			pass
			
		elif (currentAction == "EXAMINE"):
			DialogOut.emit(CharacterID,"02")
			pass
		elif currentAction == "USE":
			DialogOut.emit(CharacterID,"03")
			pass
		elif (currentAction == "TRAVERSE" && canTraverse):
			DialogOut.emit(CharacterID,"04")
			pass
