extends StaticBody2D


var vida = 3
@onready var kb_timer = $KnockBackTimer
var can_recieve_damage = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_damage(amount):
	if can_recieve_damage:
		vida -= amount
		if vida == 0:
			queue_free()
		else:
			can_recieve_damage = false
			kb_timer.start()
			$AnimationPlayer.play("Blinking")
			


func _on_knock_back_timer_timeout():
	can_recieve_damage = true
	$AnimationPlayer.play("RESET")
