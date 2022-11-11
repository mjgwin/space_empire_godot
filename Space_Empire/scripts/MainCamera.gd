extends Camera2D

var cam_speed = 350
var zoom_speed = 3
var speed_zoom_adj = 8

#example of interpolate camera towards position of mouse when it strays from center
#var mouse_offset = (get_viewport().get_mouse_position() - get_viewport().size / 2)
#$Camera2D.position = lerp(Vector2(), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)

func _ready():
	self.current = true
	
func _process(delta):
	if Input.is_key_pressed(KEY_A):
		self.global_position.x -= cam_speed * delta * zoom.x
	if Input.is_key_pressed(KEY_D):
		self.global_position.x += cam_speed * delta * zoom.x
	if Input.is_key_pressed(KEY_W):
		self.global_position.y -= cam_speed * delta * zoom.y
	if Input.is_key_pressed(KEY_S):
		self.global_position.y += cam_speed * delta * zoom.y
		
	if Input.is_key_pressed(KEY_EQUAL):
		self.zoom.x -= zoom_speed * delta
		self.zoom.y -= zoom_speed * delta
		
	if Input.is_key_pressed(KEY_MINUS):
		self.zoom.x += zoom_speed * delta
		self.zoom.y += zoom_speed * delta
		
#for selecting planet by clicking
#https://godotengine.org/qa/22606/how-ive-handled-area2d-mouse-click-not-question
		
#Example of zoom with mouse wheel action
#if Input.is_action_just_released("MWU"):
	#self.zoom.x -= zoom_speed * delta
	#self.zoom.y -= zoom_speed * delta
#if Input.is_action_just_released("MWD"):
	#self.zoom.x += zoom_speed * delta
	#self.zoom.y += zoom_speed * delta
