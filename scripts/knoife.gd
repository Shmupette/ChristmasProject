extends Area2D
@onready var attackRate = $attackRate
@onready var animation_player = $Sprite2D/AnimationPlayer

var player = null
var damage = 1

func setPlayer(player):
	self.player = player

func _process(delta):
	look_at(player.position)
	if attackRate.is_stopped():
		for area in self.get_overlapping_areas():
			if area is Enemy:
				area.takeDamage(damage)
				animation_player.play("attack")
		attackRate.start()
	
	if !animation_player.is_playing():
		animation_player.play("RESET")
