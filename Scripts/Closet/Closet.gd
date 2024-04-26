extends Node2D


@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Background = $"Background"
@onready var Inkwell = $"Inkwell"
@onready var Next_label = $"Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	Next_label.visible =false
	GameManager.initCloset()
	Traverse.connect("action", GameManager._on_closet_action)
	Talk.connect("action", GameManager._on_closet_action)
	Use.connect("action", GameManager._on_closet_action)
	Take.connect("action", GameManager._on_closet_action)
	Examine.connect("action", GameManager._on_closet_action)
	if(GameManager.puzzle3.conditions.inkwellTaken):
		Inkwell.visible = false
		
