extends "res://Scripts/interactable.gd"

@onready var UI = $"../../Early_UI"

signal takeAttempted
signal updateBackground

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID,"00")
		emit_signal("takeAttempted")
	elif (currentAction == "TALK"):
		DialogOut.emit(CharacterID,"01")
		pass
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID,"02")
		pass
	elif currentAction == "USE":
		
		if(Inventory.check_selected_item("Paper")):
			GameManager._on_puzzle3_paper_used()
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
			emit_signal("updateBackground")
			DialogOut.emit(CharacterID,"08")
		elif(Inventory.check_selected_item("Inkwell")):
			GameManager._on_puzzle3_inkwell_used()
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
			emit_signal("updateBackground")
			DialogOut.emit(CharacterID,"13")
		else:
			DialogOut.emit(CharacterID,"03")
	elif (currentAction == "TRAVERSE"):
		DialogOut.emit(CharacterID,"04")
