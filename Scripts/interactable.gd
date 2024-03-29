extends Node

@export var CharacterID: String
@export var canTraverse: bool = false
@export var traverse_path: String

var isHovering = false

#connection to other node/script
var dialoge_connection

#signals
signal DialogOut(DialogeID)

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

func interact():
	if (currentAction == "TAKE"):
		pass#TAKE
	elif (currentAction == "TALK"):
		pass#TALK 
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID)	#emits the error signal to the dialoge
		pass#examine
	elif (currentAction == "USE"):
		pass#USE 	
	elif (currentAction == "TRAVERSE" && canTraverse):
		get_tree().change_scene_to_file(traverse_path)

func _on_object_mouse_entered():
	isHovering = true # Replace with function body.

func _on_object_mouse_exited():
	isHovering = false # Replace with function body.

func _on_action(message):
	print(message)
