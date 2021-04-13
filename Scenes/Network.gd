extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const DEFAULT_IP ="127.0.0.1"
const DEFAULT_PORT =31400
const MAX_PLAYERS = 4

var server = null
var client = null

var ip_address = ""

var players = { }
var self_data = {name = "",position = Vector2(160,160)}


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#filter os and set the correspondient id
	
	match OS.get_name():
		"Windows":
			ip_address = IP.get_local_addresses()[0]
			print("windows");
			pass
		"Android":
			ip_address = IP.get_local_addresses()[3]
			print("Android");
			pass
		_:
			ip_address = IP.get_local_addresses()[0]
			print("default");
			pass
	#filter the ip address until find the correct formant
	for ip in IP.get_local_addresses():
		#print("ip:",ip)
		#if is the correct format save in the var  
		if ip.begins_with("192.168."):
			#print("holllllaaaa")
			ip_address = ip 		
	
	#connect nesesary singals		
	get_tree().connect("connected_to_server",self,"connected_to_server")
	get_tree().connect("server_disconnected",self,"server_disconnected")
	
	

#create a server with the max number of players(clientes)
func create_server():
	print("created server with ip:"+ip_address)
	server = NetworkedMultiplayerENet.new()
	server.create_server(DEFAULT_PORT,MAX_PLAYERS)
	#set this server as the one at use
	get_tree().set_network_peer(server)

#connect to a server as a client
func join_server():
	print("cc:"+str(ip_address))
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_address,DEFAULT_PORT)
	get_tree().set_network_peer(client)
# connected_to_server signal connected function 
func connected_to_server():
	print("connected to server")
	
# server_disconnectedsignal connected function 
func server_disconnected():
	print("disconnected to the server")
