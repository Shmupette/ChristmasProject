extends CanvasLayer

var player = null
@onready var progress_bar_health = $ProgressBar_Health
@onready var progress_bar_xp = $ProgressBar_XP
@onready var level = $Level


func setPlayer(player):
	self.player = player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		updateHeath()
	updateXP()
	updateLevel()

func updateHeath():
	progress_bar_health.value = player.health
	
func updateXP():
	progress_bar_xp.max_value = player.xpRequired
	progress_bar_xp.value = player.xp
	
func updateLevel():
	level.text = str(player.level)
	
