extends CanvasLayer 

@export var checklist_item_template: PackedScene

@onready var matchStatus: TextureProgressBar = $Control/HBoxContainer/matchStatus
@onready var statusLabel: Label = $Control/HBoxContainer/NinePatchRect/statuslabel
@onready var checklist_container: VBoxContainer = $checkListContainer 

var mission_ui_map = {}

func create_checklist(missions_array: Array[Mission]):
	# 1. Limpa qualquer tarefa antiga que já estivesse na tela
	for child in checklist_container.get_children():
		child.queue_free()
	mission_ui_map.clear()
	
	for missao in missions_array:
		var novo_item_lista = checklist_item_template.instantiate()
		checklist_container.add_child(novo_item_lista)
		
		novo_item_lista.set_description(missao.description)
		novo_item_lista.set_completed(missao.is_complete())
		
		mission_ui_map[missao] = novo_item_lista

func update_mission_status(missao_concluida: Mission):
	# Procura no mapa qual item visual corresponde à missão concluída
	if mission_ui_map.has(missao_concluida):
		var item_a_ser_marcado = mission_ui_map[missao_concluida]
		item_a_ser_marcado.set_completed(true)

func update_progressBar(valor: float) -> void:
	valor = clamp(valor, matchStatus.min_value, matchStatus.max_value)
	matchStatus.value = valor
	var porcentagem = int((valor - matchStatus.min_value) / (matchStatus.max_value - matchStatus.min_value)*100.0)
	statusLabel.text = "%d%%" % porcentagem
