extends Node


var click_sound_player = AudioStreamPlayer.new()
var lobby_music = AudioStreamPlayer.new()

func _ready():
	add_child(click_sound_player)
	click_sound_player.stream = preload("res://Assets/ui_click_WIP_SOUL.mp3")
	add_child(lobby_music)
	lobby_music.stream = preload("res://Assets/Soultel_Lobby_w_Filter.mp3")
func play_click_sound():
	click_sound_player.play()

func play_lobby_music():
	lobby_music.play()
