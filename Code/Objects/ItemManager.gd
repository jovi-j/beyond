extends Node2D

var blood = preload("res://Scenes/Object/sangue.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	for children in get_parent().get_children():
		if children.is_in_group("enemies"):
			children.connect("drop_item", _on_slime_drop_item)

func _process(delta):
	pass


func _on_slime_drop_item(position : Vector2):
	var new_blood = blood.instantiate()
	new_blood.position = position
	add_child(new_blood)
	
