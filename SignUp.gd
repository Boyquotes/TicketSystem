extends Node2D

#const SQLITE = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
#var db
#var db_name = "res://DataStore/TicketSystem"
var username = null
var password = null

#func _ready():
#	db = SQLITE.new()
#	db.path = db_name
#	username = null
#	password = null
#	test()
	
func test():
#	db.open_db()
	var tablename = "users"
#	db.query("select * from " + tablename + ";")
#	for i in range(0,db.query_result.size()):
#		print("Query results ", db.query_result[i]["username"], " ")

#func CreateUser(username, password):
#	db.open_db()
#	var tablename = 'users'
#	var dict : Dictionary = Dictionary()
#	dict["username"] = username
#	db.insert_row(tablename, dict)

func _on_Confirm_pressed():
	username = str($Username/LE_Username.text)
	password = str($Passowrd/LE_Password.text)
#	CreateUser(username, password)
	username = ''
	password = ''
