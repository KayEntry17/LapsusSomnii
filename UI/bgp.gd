extends Node2D
func _process(delta: float) -> void:
	queue_redraw()
func _draw():
	var polygons = Geometry2D.merge_polygons($"../Line2D3".points, PackedVector2Array([]))
	for i in polygons:
		draw_colored_polygon(i,Color.BLACK)
