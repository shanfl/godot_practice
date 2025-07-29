@tool
extends Node2D
const ICON : Texture2D = preload("res://icon.svg")

func _enter_tree() -> void:
	print("enter_tree")

func _process(delta: float) -> void:
	#print("_process");
	#queue_redraw();
	pass
	
func _draw() -> void:
	print("draw")
	pass
	

func _ready() -> void:
	print("_ready")
	
	
	await get_tree().process_frame;
	print("after get_tree().process_frame;")
	var item_rid:RID = self.get_canvas_item();
	RenderingServer.canvas_item_add_texture_rect(item_rid,Rect2(50,50,100,100),ICON.get_rid());
	#queue_redraw();
