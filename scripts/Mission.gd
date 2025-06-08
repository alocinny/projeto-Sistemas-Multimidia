class_name Mission
extends Resource

@export var description: String = "Descrição da missão"
@export var event_type: String = "evento_unico" # Ex: "moeda_coletada", "inimigo_derrotado"
@export var target_count: int = 1

var current_count: int = 0
signal mission_completed

func is_complete() -> bool:
	return current_count >= target_count

func update_progress(amount: int = 1):
	if is_complete():
		return

	current_count += amount
	print("Progresso da missão '", event_type, "': ", current_count, "/", target_count)

	if is_complete():
		print("MISSÃO COMPLETA: ", description)
		mission_completed.emit()

func reset():
	current_count = 0
