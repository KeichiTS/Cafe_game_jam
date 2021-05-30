extends Node


func _on_Start_pressed():
	get_tree().change_scene("res://Cutscenes/Cutscene.tscn")



func _on_Quit_pressed():
	get_tree().quit()
