extends "res://Scripts/interactable.gd"

signal doorman_complete

@onready var Next_label = $"../Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func interact():
	if (currentAction == "TAKE"):
		DialogOut.emit(CharacterID, "00")
		SoundManager.play_error_sfx()
	elif (currentAction == "TALK"):
		print("DOORMAN TALK")
		emit_signal("doorman_complete")
		DialogOut.emit(CharacterID, "01")
		Next_label.visible = true
		if(!done):
			waiting = true
		
	elif (currentAction == "EXAMINE"):
		DialogOut.emit(CharacterID, "02")
		pass
	elif (currentAction == "USE"):
		DialogOut.emit(CharacterID, "03")
		SoundManager.play_error_sfx()
		
	elif (currentAction == "TRAVERSE" && canTraverse):
		DialogOut.emit(CharacterID, "04")
		print("Traversing")

func talkUpper():
	print(talkOff)
	talkOff+=1
	var OutputCalc = talkOff*5+1
	print(OutputCalc)
	var outputStr
	
	if(OutputCalc < 10):
		outputStr = "0"+str(OutputCalc)
	else:
		outputStr = str(OutputCalc)
	
	if talkOff>3:
		waiting = false
	else:
		DialogOut.emit(CharacterID, outputStr)

func _input(event):
	#print("In _input")
	# Mouse in viewport coordinates.
	if not waiting:
		if Input.is_action_pressed("mouse_click") && isHovering:
			print("click")
			interact() #takes action based on what action is selected
	elif Input.is_anything_pressed() && not Input.is_action_pressed("mouse_click"):
		await talkUpper()

