extends CanvasLayer
@onready var close = $LevelUpHud/Close


var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	if player != null:
		player.pause(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setPlayer(player):
	self.player = player



func _on_close_pressed():
	player.pause(false)
	queue_free()

	pass # Replace with function body.
