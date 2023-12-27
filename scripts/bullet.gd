extends Area2D

var target = null
var damage = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position != null and target != null:
		position = position.move_toward(Vector2(target.position), delta * 50)
		if position.distance_to(target.position) < 4:
			target.takeDamage(damage)
			queue_free()
	else:			
		queue_free()
	pass
	


	
