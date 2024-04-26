extends "res://Scripts/interactable.gd"

@onready var UI = $"../Early_UI"
@onready var Background = $"../Background"

var bellhop_info = {
	"name": "Bellhop",
	"icon_path": "res://Assets/Laundry/uniform icon final.png"
}
	
func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		GameManager._on_clothes_taken()
		Inventory.add_item(bellhop_info)
		UI.update_inventory_ui()
		Background.texture = load("res://Assets/Laundry/laundryroomnoclothes without uniform.png")
		
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
