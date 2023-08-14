extends CharacterBody2D


var SPEED = 300.0

var current_state = ""
var current_face = "face_down"
var animplayer

var speed = 100

func _ready():
	
	animplayer = $AnimComponent
	

func _process(delta):
	
	
	pass
	



func _physics_process(delta):
	get_input()
	move_and_slide()


func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	
	if Input.is_action_pressed("move_right"):
		_update_state("move_right")
	if Input.is_action_pressed("move_left"):
		_update_state("move_left")
	if Input.is_action_pressed("move_down"):
		_update_state("move_down")
	if Input.is_action_pressed("move_up"):
		_update_state("move_up")
		
	if velocity.length() > 0:
		animplayer.play(current_state)
	else:
		animplayer.play(current_face)


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
