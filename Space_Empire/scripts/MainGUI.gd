extends Control


onready var FPSCounter = $CanvasLayer/FPSCounter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	FPSCounter.text = "FPS: " + str(Engine.get_frames_per_second())
