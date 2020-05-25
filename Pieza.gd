extends TextureRect

export var num = 0

var used = false
var Data

signal good(num)
signal fail(num)

func set_sprite(texture: Texture, rect: Rect2):
	$Image.texture = texture
	$Image.region_enabled = true
	$Image.region_rect = rect

func can_drop_data(position, data):
	return data.is_piece() and used == false

func drop_data(position, data):
	if data.get_num() == num and used == false:
		self.add_child(data.get_sprite().duplicate())
		used = true
		emit_signal("good", num)
	else:
		emit_signal("fail", num)

func get_drag_data(position: Vector2):
	var data = Data.new(num, $Image)
	set_drag_preview(self.duplicate())
	return data

func _ready():
	Data = load("res://Data.gd")
	pass # Replace with function body.
