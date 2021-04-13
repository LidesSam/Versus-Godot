extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	#print(Input.action_press("ui_up"))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	

	pass


func _on_MultiplayerBtn_pressed():
	
	get_tree().change_scene("res://Scenes/System/Lobby.tscn")
	
	pass # Replace with function body.


func _on_SingleplayerBtn_pressed():
	Global.mode = "single"
	get_tree().change_scene("res://Scenes/GameRooms/PusherJump.tscn")
	pass # Replace with function body.
