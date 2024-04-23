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
		"keyTaken" : false,
		"keyUsed" : false
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
		"zoom" : get_node("/root/Node2D/Desk_Zoom"),
		"closet" : get_node("/root/Node2D/Door_To_Closet")
	}
	
func initRoom2DeskZoom():
	puzzle2["nodes"] = {
		"clerk" : get_node("/root/Room2-deskZoom/Clerk"),
		"bell" : get_node("/root/Room2-deskZoom/Bell"),
		"key" : get_node("/root/Room2-deskZoom/Key"),
		"back" : get_node("/root/Room2-deskZoom/Back")
	}

func initLobby():
	puzzle2["nodes"] = {
		"door_to_hallway" : get_node("/root/Room3/DoorToHallway"),
		"door_to_laundry" : get_node("/root/Room3/DoorToOffice"),
		"door_to_office" : get_node("/root/Room3/DoorToLaundry"),
		"back" : get_node("/root/Room3/back")
	}


func initLaundry():
	puzzle2["nodes"] = {
		"bellhop" : get_node("/root/Room3/BellhopTemp"),
		"back" : get_node("/root/LaundryRoom/back")
	}

func initOffice():
	puzzle2["nodes"] = {
		"automaton" : get_node("/root/Office/Automaton"),
		"back" : get_node("/root/Office/back")
	}
	
	
func initHallway():
	puzzle2["nodes"] = {
		"room1" : get_node("/root/RoomsHallway/GuestRoom1"),
		"room2" : get_node("/root/RoomsHallway/GuestRoom2"),
		"room3" : get_node("/root/RoomsHallway/GuestRoom3"),
		"back" : get_node("/root/RoomsHallway/back")
	}
	
func guestroom1():
	puzzle2["nodes"] = {
		"ghost" : get_node("/root/GuestRoom1/Ghost")
	}
'''
Puzzle 1
'''
func _on_room1_action(action):
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
	puzzle2["nodes"]["closet"].setCurrentAction(action)

func _on_room2_deskzoom_action(action):
	puzzle2["nodes"]["clerk"].setCurrentAction(action)
	puzzle2["nodes"]["bell"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)
	if !puzzle2["conditions"]["keyTaken"]:
		puzzle2["nodes"]["key"].setCurrentAction(action)

func _on_puzzle2_keyPickup():
	puzzle2["conditions"]["keyTaken"] = true

func _on_puzzle2_keyUsed():
	puzzle2["conditions"]["keyUsed"] = true


func _on_lobby_action(action):
	puzzle2["nodes"]["door_to_hallway"].setCurrentAction(action)
	puzzle2["nodes"]["door_to_laundry"].setCurrentAction(action)
	puzzle2["nodes"]["door_to_office"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)
	
func _on_laundry_action(action):
	puzzle2["nodes"]["bellhop"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)
	
func _on_office_action(action):
	puzzle2["nodes"]["automaton"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)

func _on_hallway_action(action):
	puzzle2["nodes"]["room1"].setCurrentAction(action)
	puzzle2["nodes"]["room2"].setCurrentAction(action)
	puzzle2["nodes"]["room3"].setCurrentAction(action)
	puzzle2["nodes"]["back"].setCurrentAction(action)
	
func _on_guestroom1_action(action):
	puzzle2["nodes"]["ghost"].setCurrentAction(action)
