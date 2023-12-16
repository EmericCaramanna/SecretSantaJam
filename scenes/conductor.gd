extends AudioStreamPlayer

@export var bpm := 100
@export var measures := 4

#track beat and song position
var song_position = 0.0
var song_position_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var measure = 1

# how close to beat event is
var closest = 0
var time_off_beat = 0.0

signal Beat(position)
signal Measure(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	sec_per_beat = 60.0 / bpm


func _physics_process(delta):
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		_report_beat()
	
func _report_beat():
	if last_reported_beat < song_position_in_beats:
		if measure > measures:
			measure = 1
		emit_signal("Beat", song_position_in_beats)
		emit_signal("Measure", measure)
		last_reported_beat = song_position_in_beats
		measure += 1

func play_with_beat_offset(num):
	beats_before_start = num
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()
