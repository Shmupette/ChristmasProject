extends Node

const ENEMY = preload("res://scenes/enemy.tscn")
const PROTAG = preload("res://scenes/protag.tscn")
const HUD = preload("res://scenes/HUD.tscn")
@onready var mob_spawn_timer = $mobSpawnTimer
@onready var mob_spawn_follow_path = $mobSpawnPath/mobSpawnFollowPath

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	player = PROTAG.instantiate()
	add_child(player)
	mob_spawn_timer.start()

func _on_mob_spawn_timer_timeout() -> void:
	var mob = ENEMY.instantiate()
	mob.setPlayer(player)
	mob_spawn_follow_path.progress_ratio = randf()
	mob.position = mob_spawn_follow_path.position
	add_child(mob)
