extends Node
@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Background = $"Background"
@onready var Next_label = $"Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.initLaundry()
	#Next_label.visible =false
	Traverse.connect("action", GameManager._on_laundry_action)
	Talk.connect("action", GameManager._on_laundry_action)
	Use.connect("action", GameManager._on_laundry_action)
	Take.connect("action", GameManager._on_laundry_action)
	Examine.connect("action", GameManager._on_laundry_action)
	if(GameManager.puzzle3.conditions.clothesTaken):
		Background.texture = load("res://Assets/Laundry/laundryroomnoclothes without uniform.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


