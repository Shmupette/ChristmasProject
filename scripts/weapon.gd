extends Area2D
@onready var attackRate = $attackRate

var player = null
var damage = 1

func setPlayer(player):
	self.player = player

func _physics_process(delta):
	self.rotation += 0.05

func _process(delta):
	if attackRate.is_stopped():
		attackRate.start()
		for area in self.get_overlapping_areas():
			if area is Enemy:
				area.takeDamage(damage)


