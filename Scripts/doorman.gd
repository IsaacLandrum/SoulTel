extends Node

var isHovering = false

signal doorman_complete

var currentAction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_pressed("mouse_click") && isHovering:
		if (currentAction == "TALK"):
			emit_signal("doorman_complete")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	isHovering = true

func _on_mouse_exited():
	isHovering = false

func setCurrentAction(action):
	currentAction = action
