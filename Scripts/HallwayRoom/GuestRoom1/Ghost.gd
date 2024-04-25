extends "res://Scripts/interactable.gd"

@onready var UI = $"../../Early_UI"

signal ghost_talked
signal paper_returned

func interact():
	if (currentAction == "TAKE"):
		pass
	elif currentAction == "TALK":
		if (!GameManager.puzzle3.conditions.ghostTalked):
			emit_signal("ghost_talked")
	elif (currentAction == "EXAMINE"):
		print("Clicked with EXAMINE")
		pass
	elif currentAction == "USE":
		print("Clicked with USE")
		if(Inventory.check_selected_item("Paper_Writing")):
			emit_signal("paper_returned")
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
	elif (currentAction == "TRAVERSE" && canTraverse):
		pass
