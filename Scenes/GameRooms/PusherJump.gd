extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentPlayer= 0
const player_factory = preload("res://Scenes/Obj/PlayerJumper.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Global.mode=="single"):
	
		_join_player()
		_join_player()
	else:
		_join_player(Network.self_data.name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _join_player(pjname ="No Asigned"):
	var pj  = player_factory.instance()
	pj.set_name(pjname)
	pj.set_position(Vector2(100+100*currentPlayer,100))
	add_child(pj)
	pj.set_frame(currentPlayer)
	currentPlayer+=1
	
	# match currentPlayer:
		# 1: pj.set_position($Position/PJ1.get_position_in_parent())
		# 2: pj.set_position($Position/PJ2.get_position_in_parent())
		# 3: pj.set_position($Position/PJ3.get_position_in_parent())
