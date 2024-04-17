
extends Node2D

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Interactable = $Interactable
@onready var Doorman = $Doorman

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.initRoom1()
	Traverse.connect("action", GameManager._on_room1_action)
	Talk.connect("action", GameManager._on_room1_action)
	Use.connect("action", GameManager._on_room1_action)
	Take.connect("action", GameManager._on_room1_action)
	Examine.connect("action", GameManager._on_room1_action)
	
	Doorman.connect("doorman_complete", GameManager._on_puzzle1_doormanComplete)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
