extends "res://Scripts/interactable.gd"

signal paper_pickup

func interact():
	if (GameManager.puzzle3.conditions.ghostTalked):	
		if (currentAction == "TAKE"):
			emit_signal("paper_pickup")
		elif (currentAction == "TALK"):
			pass
		elif (currentAction == "EXAMINE"):
			pass
		elif currentAction == "USE":
			pass
		elif (currentAction == "TRAVERSE" && canTraverse):
			pass
