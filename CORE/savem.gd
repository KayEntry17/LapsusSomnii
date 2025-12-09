extends Node
@export var flagsdata:Dictionary[String, int]
#@export var flagsdataexp:Dictionary[String, int]
@export var plname:String
var volm:=linear_to_db(0.7)
var volsfx:=linear_to_db(0.7)
var volmus:=linear_to_db(0.7)
func _ready() -> void:
	#load_game()
	pass
func save():
	volsfx=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	volm=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	volmus=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	var save_dict={
		"core":flagsdata,
		"name":plname,
		"volmast":volm,
		"volmus":volmus,
		"volsfx":volsfx
		}
	return save_dict
func save_game():
	var save_game = FileAccess.open("user://corvine.save", FileAccess.WRITE)
	var json_string=JSON.stringify(save())
	save_game.store_line(json_string)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func load_game():
	if not FileAccess.file_exists("user://corvine.save"):
		return
	else:
		
		var save_gamex = FileAccess.open("user://corvine.save", FileAccess.READ)
		while save_gamex.get_position()<save_gamex.get_length():
			var json_string =save_gamex.get_line()
			var json=JSON.new()
			var parse_result=json.parse(json_string)
			var node_data=json.get_data()
			#print(node_data)
			volm=node_data["volmast"]
			var dicm=(node_data["core"])
			flagsdata={}
			for i in dicm.keys():
				flagsdata.get_or_add(i,int(dicm[i]) )
				#print(flagsdata)
				
			plname=node_data["name"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),volm)
			volmus=node_data["volmus"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),volmus)
			volsfx=node_data["volsfx"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),volsfx)
func _process(delta: float) -> void:
	pass
