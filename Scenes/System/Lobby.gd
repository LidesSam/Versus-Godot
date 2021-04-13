extends Control

var state = "main" 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var layerModes
onready var mainUI = 	$MainLayer
onready var createUI = 	$CreateLayer
onready var joinUI = 	$JoinLayer
onready var deviceIPAddress= $CanvasLayer/IPAddresLBL 
onready var serverIPAddress= $IPLineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected",self, "player_connected")
	get_tree().connect("network_peer_disconnected",self, "player_disconnected")
	get_tree().connect("connected_to_server",self, "_coneccted_to_server")
	#print(Network.ip_address)#
	deviceIPAddress.text = Network.ip_address


func change_mode(next_state="main"):
	state=next_state


	
	
	match state:
		"main":
	
			createUI.hide()
			joinUI.hide()
			mainUI.show()
			
		"create":
			mainUI.hide()
			createUI.show()
		"join":
			mainUI.hide()
			joinUI.show()
			
		_:
			change_mode("main")
#msg if the player connect correctly#
func player_connected(id):
	print("Player "+str(id)+" sucefully connected to the server ")
	
	pass

#msg if the player connect correctly#
func player_disconnected(id):
	print("Player "+str(id)+" disconnect form this server ")
	pass
func _coneccted_to_server():
	pass


# used to retrunt to main layer form join and create layer
func _on_BackBtn_pressed():
	change_mode("main")
	


func _on_CreateBtn_pressed():
	#change_mode("create")# the screen gonna be use in futhe develop of the system
	mainUI.hide()#comment id discomment change_mode, that call made this redudant
	Network.create_server()
	pass 
 
func _on_JoinBtn_pressed():
	#change_mode("join")#the screen gonna be use in futhe develop of the system
	
	
	if serverIPAddress.text.begins_with("192.168."):
		mainUI.hide()#comment id discomment change_mode, that call made this redudant
		Network.ip_address =  serverIPAddress.text
		Network.join_server()
	pass # Replace with function body.


func _on_CloseBtn_pressed():
	get_tree().change_scene("res://Scenes/System/MainMenu.tscn")
	pass # Replace with function body.


