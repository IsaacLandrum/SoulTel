extends Node
@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.initHallway()
	Traverse.connect("action", GameManager._on_hallway_action)
	Talk.connect("action", GameManager._on_hallway_action)
	Use.connect("action", GameManager._on_hallway_action)
	Take.connect("action", GameManager._on_hallway_action)
	Examine.connect("action", GameManager._on_hallway_action)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
