extends Node2D

const ICON : Texture2D = preload("res://icon.svg")
var pos:Vector2 = Vector2.ZERO;

func _process(delta: float) -> void:
	#queue_redraw();
	pass

func _ready() -> void:
	print("----------ready")
	
		
func _draw() -> void:
	print("draw")
	draw_texture(ICON,pos,Color.WEB_GREEN);
	pos += Vector2(0.1,0.1);
