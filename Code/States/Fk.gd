extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	player.sprite.play("fk")
	player.sx_bar.visible = true
	player.particles.emitting = true
	player.hudAnimations.play("in_heat")


func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		player.sx_bar.value += 30

	if player.sx_bar.value >= 100:
		state_machine.transition_to("Idle")
		return
	
	player.sx_bar.value -= 1

func exit():
	player.sx_bar.value = 0
	player.sx_bar.visible = false
	player.hudAnimations.play("out_heat")
	player.particles.emitting = false
	


func _on_hud_animations_animation_finished(anim_name):
	if anim_name == "in_heat":
		player.hudAnimations.play("sx")
	elif anim_name == "out_heat":
		player.playerAnimations.play("blinking")
