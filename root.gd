extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score_text
var score = 0
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	score_text = $HUD/Score
	count = $Litter.litter_count

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collected = $CleanupZone.get_overlapping_bodies().size()
	score_text.text = "%0.0f%% Collected" % ceil(score / count * 100)


func _on_Button_pressed():
	$Player.activate()
	$HUD/Button.visible = false
	$HUD/Intro.visible = false


func _on_CleanupZone_body_entered(body):
	score += 1


func _on_CleanupZone_body_exited(body):
	score -= 1
