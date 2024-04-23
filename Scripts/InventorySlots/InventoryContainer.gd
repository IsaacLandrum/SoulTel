extends "res://Scripts/interactable.gd"

@onready var Traverse = $"../../Action Wheel/Traverse"
@onready var Talk = $"../../Action Wheel/Talk"
@onready var Use = $"../../Action Wheel/Use"
@onready var Take = $"../../Action Wheel/Take"
@onready var Examine = $"../../Action Wheel/Examine"

func _ready():
	Traverse.connect("action", _setCurrentAction)
	Talk.connect("action", _setCurrentAction)
	Use.connect("action", _setCurrentAction)
	Take.connect("action", _setCurrentAction)
	Examine.connect("action", _setCurrentAction)

func _input(event):
	#print("In _input")
   # Mouse in viewport coordinates.
	if Input.is_action_pressed("mouse_click") && isHovering:
		print("click INVENTORY1")
		interact() #takes action based on what action is selected


func _setCurrentAction(action):
	currentAction = action

#from Dialoge readme
#6 each interaction has an assigned dialoge offset
#6.1 Take is assigned the offset of 0.
#6.2 talk is assigned the offset of 1
#6.3 Examine is assigned the offset of 2
#6.4 USE is assigned the offset of 3
#6.5 Traverse is assigned the offset of 4
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
		print("examine  1")
		pass
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		print("Use 1")
		SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")
		SoundManager.play_lobby_music()
		SceneTransition.changeGameScene(traverse_path)
