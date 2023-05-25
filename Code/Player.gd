class_name Player
extends CharacterBody2D

@export var speed : float= 500.0
@export var gravity : float = 3500.0
@export var jump_impulse : float = 1200.0

@onready var sprite : Sprite2D = $SadieSprite
@onready var anim_player : AnimationPlayer = $SadieAnimPlayer

func _ready():
	up_direction = Vector2.UP

func _physics_process(_delta):
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
