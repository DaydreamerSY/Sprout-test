extends Node


@onready var player = $"../TileMap/Player"

var current_state = ""
var current_face = "face_down"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):# The player's movement vector.
	# tạo movementPackage để truyền cho MoveComponent
	var movement = MovePackage.new()
	movement.velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		movement.velocity.x += 1
		_update_state("move_right")
	if Input.is_action_pressed("move_left"):
		movement.velocity.x -= 1
		_update_state("move_left")
	if Input.is_action_pressed("move_down"):
		movement.velocity.y += 1
		_update_state("move_down")
	if Input.is_action_pressed("move_up"):
		movement.velocity.y -= 1
		_update_state("move_up")
		

	if movement.velocity.length() > 0:
		movement.velocity = movement.velocity.normalized() * delta
		player.get_node("MoveAndCollideComponent")._move(movement)
		player.get_node("AnimComponent").play(current_state)
	else:
		player.get_node("AnimComponent").play(current_face)
		movement = null
		
#	print(player.get_node("Anim").get_assigned_animation())

func _update_state(new_state):
	match new_state:
		"move_right":
			current_state = "move_right"
			current_face = "face_right"
		"move_left":
			current_state = "move_left"
			current_face = "face_left"
		"move_up":
			current_state = "move_up"
			current_face = "face_up"
		"move_down":
			current_state = "move_down"
			current_face = "face_down"
			

