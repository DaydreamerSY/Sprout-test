extends Node2D

class_name MoveAndCollideComponent

@export var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _move(movepackage: MovePackage):
	get_parent().move_and_collide(movepackage.velocity * speed)
