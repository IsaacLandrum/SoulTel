extends "res://Scripts/interactable.gd"


@onready var UI = $"../Early_UI"

signal inkwell_taken

var inkwell_info = {
	"name": "Inkwell",
	"icon_path": "res://Assets/Closet/inkwell.png"
}
	
func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		GameManager.puzzle3.conditions.inkwellTaken = true
		SoundManager.play_generic_pickup()
		Inventory.add_item(inkwell_info)
		UI.update_inventory_ui()
		inkwell_taken.emit()
		
	elif (currentAction == "TALK"):
		print("TALKING")
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
		SoundManager.play_lobby_music()
		SceneTransition.changeGameScene(traverse_path)
