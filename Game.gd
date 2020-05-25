extends MarginContainer

var pieza
var pieza2
var image: Texture
const SIZE=64

func _ready():
	image = preload("res://images/image1.png")
	pieza = preload("res://Pieza.tscn")
	pieza2 = preload("res://PiezaOculta.tscn")
	$HBoxContainer/VBoxContainer/Canvas/Background.texture = image
	$HBoxContainer/VBoxContainer/Canvas/Background.modulate = Color(1, 1, 1, 0.25)
	$HBoxContainer/VBoxContainer/Canvas/Background.position = Vector2(image.get_width()/2, image.get_height()/2)
	
	var x=0
	var y=0
	var num = 0
	var piezas = []
	while(x<image.get_width()):
		while(y<image.get_height()):
			piezas.push_front(create_child(pieza.instance(), image,x,y, num))
			var p2 = create_child(pieza2.instance(), image,x,y, num)
			p2.get_node("Control").connect("fail", self, "_on_Pieza2_fail")
			p2.get_node("Control").connect("good", self, "_on_Pieza2_good")
			p2.rect_position = Vector2(x, y)
			$HBoxContainer/VBoxContainer/Canvas/Imagen.add_child(p2)
			y = y + SIZE
			num = num + 1
		x = x + SIZE
		y = 0
	randomize()
	piezas.shuffle()
	for p in piezas:
		$HBoxContainer/Scroll/Piezas.add_child(p)

func create_child(p, image, x, y, num):
	p.get_node("Control").num = num
	# p.rect_position = Vector2(num * SIZE + 5*num, 0)
	p.get_node("Control").set_sprite(image, Rect2(x, y, SIZE, SIZE))
	return p

func _on_Pieza2_fail(num):
	pass

func _on_Pieza2_good(num):
	for p in $HBoxContainer/Scroll/Piezas.get_children():
		if p.get_node("Control").num == num:
			$HBoxContainer/Scroll/Piezas.remove_child(p)
