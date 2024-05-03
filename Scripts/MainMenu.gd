extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_title_music()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	SceneTransition.changeMenuScene("res://Scenes/intro.tscn")
	
	
