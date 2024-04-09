extends Node

@export var CharacterID: String
@export var canTraverse: bool = false
@export var traverse_path: String
var isHovering = false

#connection to other node/script
var dialoge_connection

#signals
signal DialogOut(DialogeID)

# Called when the node enters the scene tree for the first time.
func _ready():
	dialoge_connection = get_node("/root/Node2D/Early_UI/TextBox")
	print(get_path())


func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_pressed("mouse_click") && isHovering:
		print("click")
		interact("TODO")
		 #takes action based on what action is selected
# Called every frame. 'delta' is the elapsed time since the previous frame.


func interact(action):
	if (action == "TAKE"):
		pass#TAKE
	if (action == "TALK"):
		pass#TALK 
	if (action == "EXAMINE"):
		DialogOut.emit(CharacterID)	#emits the error signal to the dialoge
		pass#examine
	if (action == "USE"):
		pass#USE 	
	if (action == "MOVE" && canTraverse):
		get_tree().change_scene_to_file(traverse_path)

func _on_object_mouse_entered():
	isHovering = true # Replace with function body.

func _on_object_mouse_exited():
	isHovering = false # Replace with function body.
