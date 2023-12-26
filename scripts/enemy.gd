extends CharacterBody2D
class_name  Enemy
var protag = null
var movementSpeed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _physics_process(delta):
	look_at(protag.position)
	position = position.move_toward(Vector2(protag.position), delta * movementSpeed)

func _process(delta):
	pass

func setPlayer(protag):
	self.protag = protag
