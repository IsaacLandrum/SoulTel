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
		SoundManager.play_door_jiggle()
		pass
	elif (currentAction == "USE"):
		if(Inventory.check_selected_item("Key")):
			SoundManager.play_unlock_door()
			GameManager._on_puzzle2_keyUsed()
			print("DOOR UNLOCKED")
			Inventory.remove_item(Inventory.get_selected_item())
			UI.update_inventory_ui()
			
		else:
			DialogOut.emit(CharacterID, "03")
			SoundManager.play_door_jiggle()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		if(GameManager.puzzle2.conditions.keyUsed):
			SceneTransition.changeGameScene(traverse_path)
			print("Traversing")
		else:
			print("DOOR IS LOCKED")
			DialogOut.emit(CharacterID, "04")
			SoundManager.play_door_jiggle()
