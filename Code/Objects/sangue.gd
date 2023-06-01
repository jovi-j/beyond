extends Area2D

func _ready():
	$AnimationPlayer.play("flutuar")


func _on_body_entered(body):
	if body.name == "Sadie":
		body.get_blood(40)
		queue_free()

