var _num: int
var _sprite: Sprite
var _piece: bool

func _init(_num: int, _sprite: Sprite):
	self._num = _num
	self._sprite = _sprite
	self._piece = true
	
func get_num():
	return _num

func get_sprite():
	return _sprite

func is_piece():
	return _piece
