extends CharacterBody2D

const HUD = preload("res://scenes/HUD.tscn")
const KNOIFE = preload("res://scenes/knoife.tscn")
@onready var weapon_pivot = $weaponPivot
@onready var animation_player = $Sprite2D/AnimationPlayer
@onready var sprite_2d = $Sprite2D

var speed = 40
var health = 100
var hud = null
var knoifes = []
var orbitAngleOffset = 0

func _ready():
	hud = HUD.instantiate()
	hud.setPlayer(self)
	add_child(hud)
		
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction == Vector2.ZERO:
		animation_player.play("idle")
	else:
		animation_player.play("run")
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	
func _process(delta):
	weapon_pivot.rotate(0.02)
	orbitAngleOffset += 2 * PI * delta / float(360)
	orbitAngleOffset = wrapf(orbitAngleOffset, -PI, PI)
	if knoifes.size() > 0:
		updateKnoifes()
	

func _input(event):
	if event.is_action_pressed("left"):
		sprite_2d.flip_h = false
	if event.is_action_pressed("right"):
		sprite_2d.flip_h = true
		
	if event.is_action_pressed("knoife"):
		giveKnoife()

func takeDamage(damage):
	health -= damage
	
func giveKnoife():
	print("added knoife")
	var knoife = KNOIFE.instantiate()
	knoife.setPlayer(self)
	weapon_pivot.add_child(knoife)
	knoifes.append(knoife)
	updateKnoifes()
	
func updateKnoifes():
	var freshKnoifes = []
	for knoife in knoifes:
		if knoife != null:
			freshKnoifes.append(knoife)
	knoifes = freshKnoifes
	#TODO: move this to knoife
	var spacing = 2 * PI / float(knoifes.size())
	var radius = 10
	var index = 0
	for knoife in knoifes:
		index += 1
		knoife.setTargetPosition(Vector2(cos(spacing * index + orbitAngleOffset) * radius, sin(spacing * index + orbitAngleOffset) * radius))

