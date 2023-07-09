class_name Tools extends Node

static func random_sign() -> int:
	return -1 if randi_range(0, 1) == 0 else 1
