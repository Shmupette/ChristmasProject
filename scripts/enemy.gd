extends Area2D
class_name Enemy

@onready var attacktimer = $attacktimer
@onready var animation_player = $Sprite2D/AnimationPlayer

var protag = null
var movementSpeed = 10
var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("moving")

func _physics_process(delta):
	if attacktimer.is_stopped() == false:
		movementSpeed = 0
	else:
		if position.distance_to(protag.position) < 4:
			attacktimer.start()
			animation_player.play("attack")
			protag.takeDamage(1)
		else:
			movementSpeed = 10
			animation_player.play("moving")
			look_at(protag.position)
			position = position.move_toward(Vector2(protag.position), delta * movementSpeed)

func _process(delta):
	pass

func setPlayer(protag):
	self.protag = protag

func takeDamage(damage):
	health -= damage
	print(health)
	if health <= 0:
		queue_free()


