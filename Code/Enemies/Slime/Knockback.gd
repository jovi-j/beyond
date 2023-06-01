extends EnemyState

func enter(msg := {}) -> void:
	enemy.velocity.x =  enemy.knockback_impulse * msg["direction"].x
	enemy.velocity.y -= enemy.knockback_impulse
	var tween : Tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(enemy,"modulate:v", 1, 0.2).from(15) 
	enemy.health -= msg['damage']

func physics_update(_delta: float) -> void:
	enemy.move_and_slide()
	if enemy.health <= 0:
		state_machine.transition_to("Death")
		return
	state_machine.transition_to("Air")
