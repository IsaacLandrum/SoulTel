extends Node2D

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Next_label = $"Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"
@onready var UI = $"Early_UI"

@onready var Automaton = $"CanvasLayer2/Automaton"
@onready var Background = $"TextureRect"

var paper_writing_info = {
	"name": "Paper_Writing",
	"icon_path": "res://Assets/Office/paper writing.png"
}

var paperWritten = false

func _ready():
	GameManager.initOfficeZoomed()
	updateBackground()
	Traverse.connect("action", onAnyAction)
	Talk.connect("action", onAnyAction)
	Use.connect("action", onAnyAction)
	Take.connect("action", onAnyAction)
	Examine.connect("action", onAnyAction)

	Automaton.connect("takeAttempted", onTakeAttempted)
	Automaton.connect("updateBackground", updateBackground)
	
	$"AutomatonWriteLayer/BGWritten".visible = false

func updateBackground():
	var puzzleStatus = GameManager.getPuzzle3Status()
	if puzzleStatus == 0 || puzzleStatus == 3:
		#Either the player picked up the final written paper, or the player has only used the inkwell
		Background.texture=load("res://Assets/Office/automaton_zoom/automaton with inkwell(1).png")
	elif puzzleStatus == 1:
		#The player has placed paper & inkwell, but not picked up yet
		if !paperWritten:
			#The automaton has not yet written the letter
			Background.texture=load("res://Assets/Office/automaton_zoom/automaton with paper and inkwelll.png")
			automatonWrite()
		else:
			#The automaton has already written the letter
			Background.texture=load("res://Assets/Office/automaton_zoom/automaton with paper and inkwell and writing.png")
	elif puzzleStatus == 2:
		Background.texture=load("res://Assets/Office/automaton_zoom/automaton with paper.png")
	else:
		Background.texture=load("res://Assets/Office/automaton_zoom/automaton plain.png")

func automatonWrite():
	$"AutomatonWriteLayer/BGWritten".visible = true
	$"AutomatonWriteLayer/AnimationPlayer".play("new_animation")
	SoundManager.play_automaton_write()
	await get_tree().create_timer(4.0).timeout
	Background.texture = load("res://Assets/Office/automaton_zoom/automaton with paper and inkwell and writing.png")
	$"AutomatonWriteLayer/BGWritten".visible = false
	paperWritten = true

func onAnyAction(action):
	GameManager._on_office_zoomed_action(action)

func onTakeAttempted():
	if GameManager.getPuzzle3Status() == 1 && paperWritten:
		GameManager._on_puzzle3_written_paper_picked_up()
		Inventory.add_item(paper_writing_info)
		UI.update_inventory_ui()
		updateBackground()

func _on_animation_player_animation_finished():
	return true
