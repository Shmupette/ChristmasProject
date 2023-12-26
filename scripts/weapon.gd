extends CharacterBody2D

var player = null

func setPlayer(player):
	self.player = player

func _physics_process(delta):
	
	self.rotation += 0.05
