extends Area2D

func _ready():
	monitoring = true

func _on_Area2D_area_entered(area):
	if area.is_in_group("VotreAutreGroupe"):
		print('wall')
