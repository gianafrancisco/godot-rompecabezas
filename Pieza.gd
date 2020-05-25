extends TextureRect

export var num = 0

var used = false

signal good(num)
signal fail(num)

func set_sprite(texture: Texture, rect: Rect2):
	$Image.texture = texture
	$Image.region_enabled = true
	$Image.region_rect = rect

func can_drop_data(position, data):
	return typeof(data) == TYPE_DICTIONARY and data.has("num") and data.has("sprite") and used == false

func drop_data(position, data):
	if int(data["num"]) == num and used == false:
		$Image.show()
		used = true
		emit_signal("good", num)
	else:
		emit_signal("fail", num)

func get_drag_data(position: Vector2):
	var data = {}
	data["num"] = num
	data["sprite"] = $Image
	set_drag_preview(self.duplicate())
	return data

func _ready():
	pass # Replace with function body.
