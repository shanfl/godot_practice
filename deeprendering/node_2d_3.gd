extends Node2D
const ICON : Texture2D = preload("res://icon.svg")

var viewport :RID;
var canvas:RID;
var canvas_item:RID;
func _ready() -> void:
	print("_ready")
	#await get_tree().process_frame;
	"""
	viewport = RenderingServer.viewport_create();
	RenderingServer.viewport_set_size(viewport,100,100);
	RenderingServer.viewport_set_active(viewport,true);
	RenderingServer.viewport_set_clear_mode(viewport,RenderingServer.VIEWPORT_CLEAR_ALWAYS);
	RenderingServer.viewport_set_update_mode(viewport,RenderingServer.VIEWPORT_UPDATE_ALWAYS);
	"""
	
	viewport = get_tree().root.get_viewport_rid();
	
	
	
	canvas = RenderingServer.canvas_create();
	RenderingServer.viewport_attach_canvas(viewport,canvas);
	
	canvas_item = RenderingServer.canvas_item_create();
	RenderingServer.canvas_item_set_parent(canvas_item,canvas);
	
	RenderingServer.canvas_item_add_circle(canvas_item,Vector2(50,50),25,Color.WEB_GREEN);
	
	
	#await RenderingServer.frame_post_draw;
	
	RenderingServer.force_draw()
	
	
	print("after await RenderingServer.frame_post_draw;");
	var tex:RID = RenderingServer.viewport_get_texture(viewport);
	var img :Image = RenderingServer.texture_2d_get(tex);
	img.save_png("res://export.png")
	
func _draw() -> void:
	print("_draw")	
	draw_texture(ICON,Vector2(200,200),Color.WEB_GREEN);
	
func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE :
		pass

	
