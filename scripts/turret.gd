extends Node2D
const BULLET = preload("res://scenes/bullet.tscn")
@onready var attackTimer = $attackTimer

var damage = 1
var turrentRange = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if attackTimer.is_stopped() and targetFinder() != null:
		attackTimer.start()
		var bullet: Node2D = BULLET.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = global_position
		bullet.target = targetFinder()
	pass

func _physics_process(delta):
	var target = targetFinder()
	if target != null:
		look_at(target.position)		
	pass

func targetFinder():
	var target = null
	if get_tree().has_group("enemy"):
		var allEnemies = get_tree().get_nodes_in_group("enemy")
		for enemy in allEnemies:
			if enemy != null:
				if self.global_position.distance_squared_to(enemy.global_position) < turrentRange:
					target = enemy
			if target != null:
				var distanceToEnemy = self.global_position.distance_squared_to(enemy.global_position)
				var distanceToTarget = self.global_position.distance_squared_to(target.global_position)
				if distanceToEnemy < distanceToTarget:
					target = enemy
	return target
		

