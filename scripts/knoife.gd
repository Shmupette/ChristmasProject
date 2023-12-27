extends Area2D
@onready var attack = $attack
@onready var animation_player = $Sprite2D/AnimationPlayer

var player = null
var damage = 1
var targetPosition = Vector2.ZERO
var damaged = false
var queuedToDelete = false

func getQueuedToDelete():
	return queuedToDelete

func _ready():
	animation_player.play("spawn")

func setPlayer(player):
	self.player = player

func _process(delta):
	look_at(player.position)
	position = targetPosition
	
	if attack.is_stopped():
		for area in self.get_overlapping_areas():
			if area is Enemy:
				area.takeDamage(damage)
				animation_player.play("attack")
				attack.start()
				damaged = true
		
	if animation_player.is_playing() && damaged:
		queuedToDelete = true
	elif !animation_player.is_playing() && !damaged:
		animation_player.play("RESET")
	elif !animation_player.is_playing() && damaged:
		queue_free()

func setTargetPosition(vector):
	targetPosition = vector

