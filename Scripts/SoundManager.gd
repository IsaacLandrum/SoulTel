extends Node


var click_sound_player = AudioStreamPlayer.new()
var lobby_music = AudioStreamPlayer.new()
var locked_door =AudioStreamPlayer.new()
var error_sfx = AudioStreamPlayer.new()
func _ready():
	add_child(click_sound_player)
	click_sound_player.stream = preload("res://Assets/Sound/action_select.mp3")
	add_child(lobby_music)
	lobby_music.stream = preload("res://Assets/Soultel_Lobby_w_Filter.mp3")
	add_child(locked_door)
	locked_door.stream= preload("res://Assets/Sound/locked_door_jiggle.mp3")
	add_child(error_sfx)
	error_sfx.stream = preload('res://Assets/Sound/error_blip.mp3')
	
func play_click_sound():
	click_sound_player.play()

func play_lobby_music():
	lobby_music.play()
func play_locked_door():
	locked_door.play()
func play_error_sfx():
	error_sfx.play()

