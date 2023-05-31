extends CanvasLayer




func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/UI/game_over.tscn")


func _on_sadie_died():
	get_tree().paused = true
	$AnimationPlayer.play("Game_over")
