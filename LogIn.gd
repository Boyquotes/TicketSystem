extends Node2D

const DATABASE_PATH_RES = "res://DataStore/TicketSystem.db"
const DATABASE_PATH = "user://TicketSystem.db"

# Check if file exists, move it to user path if not 
var dir = Directory.new();

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db # database object
var db_name = "res://DataStore/TicketSystem.db" # path to db

var show_password = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if !dir.file_exists(DATABASE_PATH):
		dir.copy(DATABASE_PATH_RES, DATABASE_PATH);
		print("Copied db file to users dir")
	$Password_LN.secret = true

func _process(delta):
	pass

func _on_Sprite_pressed():
	if show_password == true:
		show_password = false
		$Password_LN.secret = true
	elif show_password == false:
		show_password = true
		$Password_LN.secret = false


func _on_Button_pressed():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var tablename = "users"
	var columname = "username"
	db.query("select " + columname + " from " + tablename + ";")
	for i in range(0,db.query_result.size()):
		print(db.query_result[i]['username'])
		$Title.text = db.query_result[i]['username']

func CheckCrendential():
	var username_input = $Username_LN.text
	var password_input = $Password_LN.text
	var tablename = "users"
	
	if username_input == 'Jolie_Croquette' and password_input == 'admin':
		get_tree().change_scene("res://SelectPlace.tscn")
	
	
		
	

