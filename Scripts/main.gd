extends Node2D

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Interactable = $Interactable
@onready var Doorman = $Doorman

var doormanComplete = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Traverse.connect("action", _on_action)
	Talk.connect("action", _on_action)
	Use.connect("action", _on_action)
	Take.connect("action", _on_action)
	Examine.connect("action", _on_action)
	
	Doorman.connect("doorman_complete", _on_doorman_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_action(action):
	if doormanComplete:
		Interactable.setCurrentAction(action)
	Doorman.setCurrentAction(action)

func _on_doorman_complete():
	doormanComplete = true
