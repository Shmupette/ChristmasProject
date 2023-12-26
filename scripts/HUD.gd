extends CanvasLayer

var player = null
@onready var progress_bar_health = $ProgressBar_Health

func setPlayer(player):
	self.player = player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		updateHeath()
	pass

func updateHeath():
	progress_bar_health.value = player.health