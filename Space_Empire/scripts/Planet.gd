extends Node2D

#Textures
var blue_planet = preload("res://assets/textures/space/blue_planet.png")
var dull_planet = preload("res://assets/textures/space/dull_planet.png")
var flame_planet = preload("res://assets/textures/space/flame_planet.png")


var planet_type = "default"

func _ready():
	pass


func _on_Area2D_area_entered(area):
	pass # Replace with function body.

func set_type(planet_type):
	self.planet_type = planet_type
	var sprite = get_node("Sprite")
	if(planet_type == "blue"):
		sprite.set_texture(blue_planet)
	elif(planet_type == "dull"):
		sprite.set_texture(dull_planet)
	elif(planet_type == "flame"):
		sprite.set_texture(flame_planet)
	
