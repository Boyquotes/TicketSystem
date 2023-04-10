extends Node2D
var database = PostgreSQLClient.new()

var user = "postgres"
var password = "allomap1405"
var host = "34.124.115.93"
var port = "5432"
var databaseConnection = "TicketSystem"

var show_password = false

# Called when the node enters the scene tree for the first time.
func _ready():
	database.connect("connection_etablished", self, "selectFromDB")
	database.connect("connection_error", self, "error")
	database.connect("connection_closed", self, "closedConnection")
	
	database.connect_to_host("postgresql://" + user + ":" + password + "@" + host + ":" + port + "/" + databaseConnection)
	$Password_LN.secret = true

func _process(delta):
	database.poll()
	pass

func closedConnection():
	print("database has closed")

func selectFromDB():
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	SELECT * FROM "TicketSystem".users
	""")
	
	for d in data:
		print(d.data_row)
	if not database.error_object.empty():
		prints("Error:", database.error_object)
	database.close()
	
func _exit_tree():
	database.close()

func _on_Sprite_pressed():
	if show_password == true:
		show_password = false
		$Password_LN.secret = true
	elif show_password == false:
		show_password = true
		$Password_LN.secret = false


func _on_Button_pressed():
	selectFromDB()

func LogIn():
	var username_input = $Username_LN.text
	var password_input = $Password_LN.text
	var tablename = "users"
		
	

