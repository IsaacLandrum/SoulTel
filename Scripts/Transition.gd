extends CanvasLayer


func changeScene(target: String) -> void:
	$"AnimationPlayer".play("Dissolve")
	await get_tree().create_timer(1.0).timeout
	if _on_animation_player_animation_finished():
		get_tree().change_scene_to_file(target)
		$AnimationPlayer.play_backwards("Dissolve")
		
		


func _on_animation_player_animation_finished():
	return true # Replace with function body.
