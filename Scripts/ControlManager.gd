extends Node


@export var player_speed = 100

@onready var player = $"../Player"
@onready var camera = $"../Player/Camera2D"

var current_state = ""
var current_face = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		current_state = "move_right"
		current_face = "face_right"
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		current_state = "move_left"
		current_face = "face_left"
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		current_state = "move_down"
		current_face = "face_down"
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		current_state = "move_up"
		current_face = "face_up"

	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
		player.move_and_collide(velocity * delta)
		$"../Player/Anim".play(current_state)
	else:
		$"../Player/Anim".play(current_face)
		pass
	
		
	
	
	pass

