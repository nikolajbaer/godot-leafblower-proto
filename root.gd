extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score 

# Called when the node enters the scene tree for the first time.
func _ready():
	score = $HUD/Score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collected = $CleanupZone.get_overlapping_bodies().size()
	score.text = "%f%% Collected" % ceil(collected / $Litter.litter_count * 100)


func _on_Button_pressed():
	$Player.activate()
	$HUD/Button.visible = false
	$HUD/Intro.visible = false
