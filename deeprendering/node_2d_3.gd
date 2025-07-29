extends Node2D


var viewport :RID;
var canvas:RID;
var canvas_item:RID;
func _ready() -> void:
	#await get_tree().process_frame;
	
	viewport = RenderingServer.viewport_create();
	RenderingServer.viewport_set_size(viewport,100,100);
	RenderingServer.viewport_set_active(viewport,true);
	RenderingServer.viewport_set_clear_mode(viewport,RenderingServer.VIEWPORT_CLEAR_ALWAYS);
	RenderingServer.viewport_set_update_mode(viewport,RenderingServer.VIEWPORT_UPDATE_ALWAYS);
	canvas = RenderingServer.canvas_create();
	RenderingServer.viewport_attach_canvas(viewport,canvas);
	
	canvas_item = RenderingServer.canvas_item_create();
	RenderingServer.canvas_item_set_parent(canvas_item,canvas);
	
	RenderingServer.canvas_item_add_circle(canvas_item,Vector2(50,50),25,Color.AQUAMARINE);
	
	await RenderingServer.frame_post_draw;
	
	var tex:RID = RenderingServer.viewport_get_texture(viewport);
	var img :Image = RenderingServer.texture_2d_get(tex);
	img.save_png("res://export.png")
	
	
