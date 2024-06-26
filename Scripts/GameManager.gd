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

var puzzle3 = {
	"conditions" : {
		"ghostTalked" : false,
		"paperPickedUp" : false,
		"paperUsed" : false,
		"clothesTaken" : false,
		"clothesWorn" : false,
		"inkwellTaken" : false,
		"inkwellUsed" : false,
		"writtenPaperPickedUp" : false
	}
}

# Need initializer functions to ensure nodes are in scope when initialized
func initRoom1():
	puzzle1["nodes"] = {
		"doorman" : get_node("/root/Node2D/Doorman"),
		"door" : get_node("/root/Node2D/Interactable"),
		"Wall_Lamp": get_node("/root/Node2D/Wall_Lamp")
	}

func initRoom2():
	puzzle2["nodes"] = {
		"door_to_lobby" : get_node("/root/Node2D/Door_To_Lobby"),
		"zoom" : get_node("/root/Node2D/Desk_Zoom"),
		"closet" : get_node("/root/Node2D/Door_To_Closet"),
		"sofa" : get_node("/root/Node2D/Sofa")
	}
	
func initRoom2DeskZoom():
	puzzle2["nodes"] = {
		"clerk" : get_node("/root/Room2-deskZoom/Clerk"),
		"bell" : get_node("/root/Room2-deskZoom/Bell"),
		"key" : get_node("/root/Room2-deskZoom/Key"),
		"back" : get_node("/root/Room2-deskZoom/CanvasLayer/Back"),
		"Guestbook": get_node("/root/Room2-deskZoom/Guestbook")
	}

func initLobby():
	puzzle2["nodes"] = {
		"door_to_hallway" : get_node("/root/Room3/DoorToHallway"),
		"door_to_laundry" : get_node("/root/Room3/DoorToOffice"),
		"door_to_office" : get_node("/root/Room3/DoorToLaundry"),
		"back" : get_node("/root/Room3/CanvasLayer/back"),
		"Fireplace": get_node("/root/Room3/Fireplace")
	}

func initOffice():
	puzzle3["nodes"] = {
		"automaton" : get_node("/root/Office/Automaton"),
		"back" : get_node("/root/Office/CanvasLayer/back"),
		"Note_1": get_node("/root/Office/Note_1")
	}

func initOfficeZoomed():
	puzzle3["nodes"] = {
		"automaton" : get_node("/root/AutomatonZoom/CanvasLayer2/Automaton"),
		"back" : get_node("/root/AutomatonZoom/CanvasLayer/back")
	}
	
func initHallway():
	puzzle2["nodes"] = {
		"room1" : get_node("/root/RoomsHallway/GuestRoom1"),
		"room2" : get_node("/root/RoomsHallway/GuestRoom2"),
		"room3" : get_node("/root/RoomsHallway/GuestRoom3"),
		"Portrait": get_node("/root/RoomsHallway/Portrait"),
		"back" : get_node("/root/RoomsHallway/CanvasLayer/back")
	}
	
func initGuestRoom1():
	puzzle3["nodes"] = {
		"ghost" : get_node("/root/GuestRoom1/CanvasLayer2/Ghost"),
		"paper" : get_node("/root/GuestRoom1/CanvasLayer2/Paper")
	}

func initLaundry():
	puzzle3["nodes"] = {
		"bellhop" : get_node("/root/LaundryRoom/BellhopTemp"),
		"back" : get_node("/root/LaundryRoom/CanvasLayer/back"),
		"Washbin_Table": get_node("/root/LaundryRoom/Washbin_Table"),
		"Note_2": get_node("/root/LaundryRoom/Note_2")
	}
	print("Init Laundry")

func initCloset():
	puzzle3["nodes"] = {
		"inkwell" : get_node("/root/Closet/Inkwell"),
		"back" : get_node("/root/Closet/CanvasLayer/back"),
		"DeskChair": get_node("/root/Closet/DeskChair")
	}
	
'''
Puzzle 1
'''
func _on_room1_action(action):
	puzzle1.nodes.door.setCurrentAction(action)
	puzzle1.nodes.doorman.setCurrentAction(action)
	puzzle1.nodes.Wall_Lamp.setCurrentAction(action)

func _on_puzzle1_doormanComplete():
	puzzle1.conditions.doormanComplete = true

'''
Puzzle 2
'''
func _on_room2_action(action):
	puzzle2.nodes.door_to_lobby.setCurrentAction(action)
	puzzle2.nodes.zoom.setCurrentAction(action)
	puzzle2.nodes.closet.setCurrentAction(action)
	puzzle2.nodes.sofa.setCurrentAction(action)

func _on_room2_deskzoom_action(action):
	puzzle2.nodes.clerk.setCurrentAction(action)
	puzzle2.nodes.bell.setCurrentAction(action)
	puzzle2.nodes.back.setCurrentAction(action)
	puzzle2.nodes.Guestbook.setCurrentAction(action)
	if !puzzle2.conditions.keyTaken:
		puzzle2.nodes.key.setCurrentAction(action)

func _on_puzzle2_keyPickup():
	puzzle2.conditions.keyTaken = true

func _on_puzzle2_keyUsed():
	puzzle2.conditions.keyUsed = true


func _on_lobby_action(action):
	puzzle2.nodes.door_to_hallway.setCurrentAction(action)
	puzzle2.nodes.door_to_laundry.setCurrentAction(action)
	puzzle2.nodes.door_to_office.setCurrentAction(action)
	puzzle2.nodes.back.setCurrentAction(action)
	puzzle2.nodes.Fireplace.setCurrentAction(action)

func _on_hallway_action(action):
	puzzle2.nodes.room1.setCurrentAction(action)
	puzzle2.nodes.room2.setCurrentAction(action)
	puzzle2.nodes.room3.setCurrentAction(action)
	puzzle2.nodes.back.setCurrentAction(action)
	puzzle2.nodes.Portrait.setCurrentAction(action)
	
	
'''
Puzzle 3
'''

func _on_guestroom1_action(action):
	if (!puzzle3.conditions.ghostTalked || getPuzzle3Status() == 0):
		puzzle3.nodes.ghost.setCurrentAction(action)
	if (!puzzle3.conditions.paperPickedUp):
		puzzle3.nodes.paper.setCurrentAction(action)

func _on_puzzle3_ghost_talked():
	puzzle3.conditions.ghostTalked = true

func _on_puzzle3_paperPickup():
	puzzle3.conditions.paperPickedUp = true

func _on_puzzle3_paper_used():
	puzzle3.conditions.paperUsed = true

func _on_puzzle3_inkwell_used():
	puzzle3.conditions.inkwellUsed = true

func _on_puzzle3_written_paper_picked_up():
	puzzle3.conditions.writtenPaperPickedUp = true

func _on_office_action(action):
	puzzle3.nodes.automaton.setCurrentAction(action)
	puzzle3.nodes.back.setCurrentAction(action)
	puzzle3.nodes.Note_1.setCurrentAction(action)
	
func _on_office_zoomed_action(action):
	puzzle3.nodes.automaton.setCurrentAction(action)
	puzzle3.nodes.back.setCurrentAction(action)

func _on_laundry_action(action):
	puzzle3.nodes.bellhop.setCurrentAction(action)
	puzzle3.nodes.back.setCurrentAction(action)
	puzzle3.nodes.Washbin_Table.setCurrentAction(action)
	puzzle3.nodes.Note_2.setCurrentAction(action)

func _on_clothes_taken():
	puzzle3.conditions.clothesTaken = true

func _on_closet_action(action):
	puzzle3.nodes.inkwell.setCurrentAction(action)
	puzzle3.nodes.back.setCurrentAction(action)
	puzzle3.nodes.DeskChair.setCurrentAction(action)

func getPuzzle3Status():
	if puzzle3.conditions.paperUsed && puzzle3.conditions.inkwellUsed && puzzle3.conditions.writtenPaperPickedUp:
		return 0
	if puzzle3.conditions.paperUsed && puzzle3.conditions.inkwellUsed && !puzzle3.conditions.writtenPaperPickedUp:
		return 1
	if puzzle3.conditions.paperUsed && !puzzle3.conditions.inkwellUsed:
		return 2
	if !puzzle3.conditions.paperUsed && puzzle3.conditions.inkwellUsed:
		return 3
	if !puzzle3.conditions.paperUsed && !puzzle3.conditions.inkwellUsed:
		return 4
