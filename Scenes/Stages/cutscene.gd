extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$FloatAnim.play("Float")
	$AnimationPlayer2.play("Start game")
	if NewResource.deaths > 0:
		$AnimationPlayer3.play("ShowText")
		if NewResource.deaths == 1:
			$CenterContainer/Label.text = "Again..."
		elif NewResource.deaths == 2:
			$CenterContainer/Label.text = "One more time..."
		elif NewResource.deaths >= 3:
			$CenterContainer/Label.text = "Do not give up..."
			
func _on_animation_player_2_animation_finished(anim_name):
	if anim_name == "Start game":
		get_tree().change_scene_to_file("res://Scenes/Stages/stage_1.tscn")
