extends Sprite

onready var root=get_tree().current_scene

export var taken = false
var seat_chosen = null

func _ready():
	print(self.taken)

func ChangePlaceStatus():
	if self.taken == true:
		$Area2D/CollisionShape2D.disabled = true

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed == true:
				$ColorRect.color = Color(0.745098, 0.745098, 0.745098, 1)
				
				
				
