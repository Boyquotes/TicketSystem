extends Node2D

var show_password = false
const SQLITE = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name "res://DataStore/TicketSystem"

# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLITE.new()
	db.path = db_name
	$Password_LN.secret = show_password

func _on_Sprite_pressed():
	if show_password == true:
		show_password = false
		$Password_LN.secret = true
	elif show_password == false:
		show_password = true
		$Password_LN.secret = false


func _on_Button_pressed():
	LogIn()

func LogIn():
	var username_input = $Username_LN.text
	var password_input = $Password_LN.text
	

