extends CharacterBody2D

@export var speed = 400

func ready():
	globalScript.set("player", self)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	globalScript.set("player", self)
	move_and_slide()

