extends Node

var isHovering = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_pressed("mouse_click") && isHovering:
		print("click")
		interact("TODO") #takes action based on what action is selected
# Called every frame. 'delta' is the elapsed time since the previous frame.
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Room1Intro.dialogue"),"take")


func interact(action):
	if (action == "TAKE"):
		pass#TAKE
	if (action == "TALK"):
		pass#TALK 
	if (action == "EXAMINE"):
		pass#EXAMINE 
	if (action == "USE"):
		pass#USE 	
	if (action == "MOVE"):
		pass#MOVE 

func _on_object_mouse_entered():
	isHovering = true # Replace with function body.

func _on_object_mouse_exited():
	isHovering = false # Replace with function body.
