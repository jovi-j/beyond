extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Float")
	$AnimationPlayer2.play("Start game")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_2_animation_finished(anim_name):
	if anim_name == "Start game":
		get_tree().change_scene_to_file("res://Scenes/Stages/stage_1.tscn")
