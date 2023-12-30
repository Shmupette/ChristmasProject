extends Area2D
var baseMovementSpeed = 5
var movementSpeed = 5
var XPAmount = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("XPGems")
	print("READY")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setPosition(target):
	position = target.position
	
func Absorb(target,delta):
	position = position.move_toward(Vector2(target.position), delta * movementSpeed)
	if global_position.distance_squared_to(target.global_position) < 1:
		target.xp += XPAmount
		queue_free()
	else:
		movementSpeed += 1

