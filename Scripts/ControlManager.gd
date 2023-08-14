extends Node


@onready var player = $"../TileMap/Player"


var current_velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):# The player's movement vector.
	# tạo movementPackage để truyền cho MoveComponent

		

	
		
	player.move_and_slide()
		
#	print(player.get_node("Anim").get_assigned_animation())




			

