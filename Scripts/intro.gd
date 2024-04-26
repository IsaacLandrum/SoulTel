extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$"CanvasLayer/AnimationPlayer".play("Text Progression")
	$"CanvasLayer/skipInstructions".visible= false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	await get_tree().create_timer(10).timeout
	$"CanvasLayer/skipInstructions".visible= true
	if Input.is_anything_pressed():
		SceneTransition.changeMenuScene("res://Scenes/Main Menu.tscn")


func _on_animation_player_animation_finished():
	print("animation finished")
func _on_timer_timeout():
	SceneTransition.changeMenuScene("res://Scenes/Main Menu.tscn")
