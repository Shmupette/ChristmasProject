extends Node2D
const BULLET = preload("res://scenes/bullet.tscn")
@onready var attackTimer = $attackTimer
@onready var animation_player = $Sprite2D/AnimationPlayer
@onready var right = $Right
@onready var left = $Left

var damage = 1
var turrentRange = 5000000000
var turrentNum = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if attackTimer.is_stopped() and targetFinder() != null:
		attackTimer.start()
		animation_player.play("attack")
		var bullet: Node2D = BULLET.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.target = targetFinder()
		if turrentNum == 0:
			bullet.global_position = Vector2(left.global_position)
			turrentNum = 1
			animation_player.play("Left")
		else:
			bullet.global_position = Vector2(right.global_position)
			turrentNum = 0
			animation_player.play("Right")
			
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
		

