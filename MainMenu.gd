extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $Menu/VBoxContainer/HBoxContainer/VBoxContainer.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene):
	get_tree().change_scene(scene)
