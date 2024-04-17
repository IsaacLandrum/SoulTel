extends Node

@export var CharacterID: String
@export var canTraverse: bool = false
@export var traverse_path: String

var isHovering = false

#connection to other node/script
var dialoge_connection

#signals
signal DialogOut(CharacterID, DialogeID)

var currentAction

# Called when the node enters the scene tree for the first time.
func _ready():
	dialoge_connection = get_node("/root/Node2D/Early_UI/TextBox")
	print(get_path())


func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_pressed("mouse_click") && isHovering:
		print("click")
		interact() #takes action based on what action is selected
# Called every frame. 'delta' is the elapsed time since the previous frame.

func setCurrentAction(action):
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
		pass
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")
		SoundManager.play_lobby_music()
		SceneTransition.changeGameScene(traverse_path)

func _on_object_mouse_entered():
	isHovering = true # Replace with function body.

func _on_object_mouse_exited():
	isHovering = false # Replace with function body.

func _on_action(message):
	print(message)
