extends Node2D

#Scenes
onready var Planet = preload("res://scenes/Planet.tscn")
onready var BackgroundStar = preload("res://scenes/BackgroundStar.tscn")



var MAX_ATTEMPTS = 10000
var MIN_DISTANCE = 300

var world_width = 0
var world_height = 0

var rng = RandomNumberGenerator.new()

var planet_list = []

#var planetHeight = planet_sprite.texture.get_height()

func set_dimensions(world_width, world_height):
	self.world_width = world_width
	self.world_height = world_height

func _ready():
	rng.randomize()
	
func spawn_random_background_stars(num_stars):
	for i in range(num_stars):
		var star_spawn_vec = Vector2(rng.randi_range(0, world_width), rng.randi_range(0, world_height))
		var star_instance = BackgroundStar.instance()
		star_instance.global_position = star_spawn_vec
		add_child(star_instance)

func spawn_random_planets(num_planets):
	var curr_planets = 0
	var attempts = 0
	while curr_planets < num_planets and attempts < MAX_ATTEMPTS:
		var planet_spawn_vec = Vector2(rng.randi_range(0, world_width), rng.randi_range(0, world_height))
		if self.is_valid_spawn(planet_spawn_vec):
			var planet_instance = spawn_planet(planet_spawn_vec)
			add_child(planet_instance)
			planet_list.append(planet_instance)
			curr_planets += 1
		else:
			attempts += 1
	
	
func spawn_planet(spawn_position: Vector2):
	var planet_instance = Planet.instance()
	var planet_type = rng.randi_range(0, 2)
	if(planet_type == 0):
		planet_instance.set_type("blue")
	if(planet_type == 1):
		planet_instance.set_type("dull")
	if(planet_type == 2):
		planet_instance.set_type("flame")
		
	planet_instance.global_position = spawn_position
	return planet_instance
	
	
func is_valid_spawn(pos: Vector2):
	if self.planet_list.empty():
		return true
	
	for planet in self.planet_list:
		var other_pos = planet.global_position
		if pos.distance_to(other_pos) < MIN_DISTANCE:
			return false
	return true
