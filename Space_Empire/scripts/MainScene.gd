extends Node2D

var NUM_PLANETS = 250
var NUM_STARS = 2000
var WORLD_WIDTH = 10000
var WORLD_HEIGHT = 10000

onready var PlanetSpawner = $PlanetSpawner
onready var FPSCounter = $CanvasLayer/FPSCounter




func _ready():
	PlanetSpawner.set_dimensions(WORLD_WIDTH, WORLD_HEIGHT)
	PlanetSpawner.spawn_random_planets(NUM_PLANETS)
	PlanetSpawner.spawn_random_background_stars(NUM_STARS)
	
func _process(delta):
	FPSCounter.text = "FPS: " + str(Engine.get_frames_per_second())
	
		
