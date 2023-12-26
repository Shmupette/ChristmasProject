extends CharacterBody2D

@export var speed = 400
@export var health = 100

const HUD = preload("res://scenes/HUD.tscn")
var hud = null
const WEAPON = preload("res://scenes/weapon.tscn")
@onready var weapon_pivot = $weaponPivot

func _ready():
	hud = HUD.instantiate()
	hud.setPlayer(self)
	add_child(hud)
	giveWeapon()
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	weapon_pivot.rotate(0.05)

func _input(event):
	if event.is_action_pressed("damageTest"):
		health -= 1
		print("HEALTH:",health)

func takeDamage(damage):
	health -= damage
	
func giveWeapon():
	var weapon = WEAPON.instantiate()
	weapon.setPlayer(self)
	weapon.position = Vector2(0, 40)
	weapon_pivot.add_child(weapon)

