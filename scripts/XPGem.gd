extends Area2D

var XPAmount = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("XPGems")
	print("READY")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(global_position, " - ", position)
	pass

func setPosition(target):
	position = target.position


