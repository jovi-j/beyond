extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("new_animation")


func _on_animation_player_animation_finished(anim_name):
	queue_free()
