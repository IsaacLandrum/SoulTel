extends "res://Scripts/interactable.gd"

@onready var UI = $"../Early_UI"


func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
	elif (currentAction == "TALK"):
		print("TALKING")
		DialogOut.emit(CharacterID, "01")
		pass#TALK 
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass
	elif (currentAction == "USE"):
		if(Inventory.get_selected_item().name == "Key"):
			#Play unlock sound
			GameManager._on_puzzle2_keyUsed()
			print("DOOR UNLOCKED")
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
			
		else:
			DialogOut.emit(CharacterID, "03")
			SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		if(GameManager.puzzle2.conditions.keyUsed):
			SceneTransition.changeGameScene(traverse_path)
			print("Traversing")
		else:
			print("DOOR IS LOCKED")
			
		DialogOut.emit(CharacterID, "04")
