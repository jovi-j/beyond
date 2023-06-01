extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/Start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$CanvasLayer/Playe.play("Fadeout")



func _on_exit_pressed():
	get_tree().quit()


func _on_playe_animation_finished(anim_name):
	if anim_name == "Fadeout":
		get_tree().change_scene_to_file("res://Scenes/Stages/cutscene.tscn")
