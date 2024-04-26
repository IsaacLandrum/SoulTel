extends "res://Scripts/interactable.gd"

@onready var UI = $"../../Early_UI"
@onready var Next_label = $"../../Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"

signal ghost_talked
signal paper_returned

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID,"00")
		pass
	elif currentAction == "TALK":
		DialogOut.emit(CharacterID,"01")
		Next_label.visible = true
		if (!GameManager.puzzle3.conditions.ghostTalked):
			emit_signal("ghost_talked")
		if(!done):
			waiting = true
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID,"02")
		print("Clicked with EXAMINE")
		pass
	elif currentAction == "USE":
		DialogOut.emit(CharacterID,"03")
		print("Clicked with USE")
		if(Inventory.check_selected_item("Paper_Writing")):
			emit_signal("paper_returned")
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID,"04")
		pass
