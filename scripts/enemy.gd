extends Area2D
class_name  Enemy
@onready var attacktimer = $attacktimer
var protag = null
var movementSpeed = 50
var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _physics_process(delta):
	look_at(protag.position)
	if position.distance_to(protag.position) > 20:
		position = position.move_toward(Vector2(protag.position), delta * movementSpeed)
	elif attacktimer.is_stopped():
		attacktimer.start()
		protag.takeDamage(1)


func _process(delta):
	pass

func setPlayer(protag):
	self.protag = protag

func takeDamage(damage):
	health -= damage
	print(health)
	if health <= 0:
		queue_free()


