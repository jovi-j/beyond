class_name Player
extends CharacterBody2D

# Horizontal speed in pixels per second.
@export var speed : float= 500.0

# Vertical acceleration in pixel per second squared.
@export var gravity : float = 3500.0

# Vertical speed applied when jumping.
@export var jump_impulse : float = 1200.0

@onready var fsm := $StateMachine
@onready var sprite : AnimatedSprite2D = $PlayerSprite
@onready var sx_bar : ProgressBar = $ProgressBar
@onready var playerAnimations : AnimationPlayer = $PlayerAnimations
@onready var hudAnimations : AnimationPlayer = $HUDAnimations
@onready var particles : CPUParticles2D = $CPUParticles2D

func _ready():
	up_direction = Vector2.UP
	particles.emitting = false

func _physics_process(_delta):
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
