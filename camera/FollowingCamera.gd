extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	print(tilemap)
	var MapRect = tilemap.get_used_rect()
	var TileSize = tilemap.cell_quadrant_size
	var WorldSizeInPixel = MapRect.size * TileSize
	limit_right = WorldSizeInPixel.x
	limit_bottom = WorldSizeInPixel.y
	
	print("MapRect:", MapRect)
	print("TileSize:", TileSize)
	print("WorldSizeInPixel:", WorldSizeInPixel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
