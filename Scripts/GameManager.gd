extends Node

@onready var Interactable = $Interactable
@onready var Doorman = $Doorman

var puzzle1 = {
	"conditions" : {
		"doormanComplete" : false
	}
}
var puzzle2 = {
	"conditions" : {
		"keyTaken" : false
	}
}

# Need initializer functions to ensure nodes are in scope when initialized
func initRoom1():
	puzzle1["nodes"] = {
		"doorman" : get_node("/root/Node2D/Doorman"),
		"door" : get_node("/root/Node2D/Interactable")
	}

func initRoom2():
	puzzle2["nodes"] = {
		"door_to_lobby" : get_node("/root/Node2D/Door_To_Lobby"),
		"zoom" : get_node("/root/Node2D/Desk_Zoom")
	}
	
func initRoom2DeskZoom():
	puzzle2["nodes"] = {
		"clerk" : get_node("/root/Room2-deskZoom/Clerk"),
		"bell" : get_node("/root/Room2-deskZoom/Bell"),
		"key" : get_node("/root/Room2-deskZoom/Key"),
		"back" : get_node("/root/Room2-deskZoom/Back")
	}

'''
Puzzle 1
'''
func _on_room1_action(action):
	if puzzle1["conditions"]["doormanComplete"]:
		puzzle1["nodes"]["door"].setCurrentAction(action)
	puzzle1["nodes"]["doorman"].setCurrentAction(action)

func _on_puzzle1_doormanComplete():
	puzzle1["conditions"]["doormanComplete"] = true

'''
Puzzle 2
'''
func _on_room2_action(action):
	puzzle2["nodes"]["door_to_lobby"].setCurrentAction(action)
	puzzle2["nodes"]["zoom"].setCurrentAction(action)

func _on_room2_deskzoom_action(action):
	puzzle2["nodes"]["clerk"].setCurrentAction(action)
	puzzle2["nodes"]["bell"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)
	if !puzzle2["conditions"]["keyTaken"]:
		puzzle2["nodes"]["key"].setCurrentAction(action)

func _on_puzzle2_keyPickup():
	puzzle2["conditions"]["keyTaken"] = true
