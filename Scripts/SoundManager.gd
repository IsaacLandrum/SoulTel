extends Node


var click_sound_player = AudioStreamPlayer.new()

func _ready():
	add_child(click_sound_player)
	click_sound_player.stream = preload("res://Assets/ui_click_WIP_SOUL.mp3")

func play_click_sound():
	click_sound_player.play()
