extends Node

signal progress_updated(completed_count, total_count)
var completed_missions_count: int = 0

signal mission_state_changed(mission_resource: Mission)

@export var missions: Array[Mission]

func _ready():
	completed_missions_count = 0
	
	for mission in missions:
		mission.reset()
		
		mission.mission_completed.connect(_on_mission_completed.bind(mission))
	
	progress_updated.emit(completed_missions_count, missions.size())


func update_mission_progress(event_type_received: String, amount: int):
	for mission in missions:
		if mission.event_type == event_type_received:
			mission.update_progress(amount)

func _on_mission_completed(mission_resource: Mission):
	completed_missions_count += 1
	progress_updated.emit(completed_missions_count, missions.size())
	mission_state_changed.emit(mission_resource)
