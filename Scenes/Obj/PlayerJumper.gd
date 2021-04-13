extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump_action"):
		
		set_axis_velocity(Vector2(0,-100))
		
	pass
	
func set_position(pos=Vector2(0,0)):
	position = pos
	
func set_frame(frame=0):
	$Sprite.frame = frame
func set_name(Name):
	$Playername.text = Name
	
