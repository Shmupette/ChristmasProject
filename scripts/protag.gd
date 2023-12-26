extends CharacterBody2D

@export var speed = 400
@export var health = 100

const HUD = preload("res://scenes/HUD.tscn")
var hud = null

func _ready():
	hud = HUD.instantiate()
	hud.setPlayer(self)
	add_child(hud)


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _input(event):
	if event.is_action_pressed("damageTest"):
		health -= 1
		print("HEALTH:",health)

