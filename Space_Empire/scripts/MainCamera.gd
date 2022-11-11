extends Camera2D

var cam_speed = 300
var zoom_speed = 0.05
var speed_zoom_adj = 8

func _ready():
	self.current = true
	
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		self.global_position.x -= cam_speed * delta * zoom.x
	if Input.is_action_pressed("ui_right"):
		self.global_position.x += cam_speed * delta * zoom.x
	if Input.is_action_pressed("ui_up"):
		self.global_position.y -= cam_speed * delta * zoom.y
	if Input.is_action_pressed("ui_down"):
		self.global_position.y += cam_speed * delta * zoom.y
	if Input.is_key_pressed(KEY_W):
		self.zoom.x -= zoom_speed
		self.zoom.y -= zoom_speed
		
	if Input.is_key_pressed(KEY_S):
		self.zoom.x += zoom_speed
		self.zoom.y += zoom_speed
