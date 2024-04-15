extends Node

@export var CharacterID: String
@export var canTraverse: bool = false
@export var traverse_path: String

var isHovering = false

#connection to other node/script
#var dialoge_connection

#signals
signal DialogOut(CharacterID, DialogeID)

var currentAction

# Called when the node enters the scene tree for the first time.
func _ready():
	#dialoge_connection = get_node("/root/Node2D/Early_UI/TextBox")
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
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "03")	#emits the error signal to the dialoge
	elif (currentAction == "TALK"):
		print("TALKING")
		DialogOut.emit(CharacterID, "01")	#emits the error signal to the dialoge
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "04")	#emits the error signal to the dialoge
	elif (currentAction == "USE"):
		SoundManager.play_error_sfx()
		DialogOut.emit(CharacterID, "02")	#emits the error signal to the dialoge
	elif (currentAction == "TRAVERSE" && canTraverse):
		print("Traversing")
		DialogOut.emit(CharacterID, "00")	#emits the error signal to the dialoge
		SoundManager.play_lobby_music()
		SceneTransition.changeScene(traverse_path)

func _on_object_mouse_entered():
	isHovering = true # Replace with function body.

func _on_object_mouse_exited():
	isHovering = false # Replace with function body.

func _on_action(message):
	print(message)
