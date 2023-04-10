extends Node2D

const SQLITE = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/TicketSystem"

func _ready():
	db = SQLITE.new()
	db.path = db_name
	#test()
	
#func test():
#	db.open_db()
#	var tablename = "Users"
#	db.query("select * from " + tablename + ";")
#	for i in range(0,db.query_result.size()):
#		print("Query results ", db.query_result[i]["identifier"], " ")



