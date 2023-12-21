extends AudioStreamPlayer


@onready var start_timer = $StartTimer

# beats per minute
#This is determined by the song you're trying to sync up to
@export var songBpm: int
@export var beatsBeforeStart: int

#The number of seconds for each song beat
var secPerBeat: float

#Current song position, in seconds
var songPosition : float

#Current song position, in beats
var songPositionInBeats := 0
var prevSongPositionInBeats := 0
var measure := 1
var measures := 4

signal beatSignal(position)
signal measureSignal(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	secPerBeat = 60.0 / songBpm

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if playing:
		songPosition =  get_playback_position() + AudioServer.get_time_since_last_mix()
		songPosition -= AudioServer.get_output_latency() 
		songPositionInBeats = int(floor(songPosition / secPerBeat)) + beatsBeforeStart
		_report_beat()
	
func _report_beat():
	if prevSongPositionInBeats < songPositionInBeats:
		if measure > measures:
			measure = 1
		emit_signal("beatSignal", songPositionInBeats)
		emit_signal("measureSignal", measure)
		prevSongPositionInBeats = songPositionInBeats
		measure += 1

func play_with_beat_offset(beats):
	beatsBeforeStart = beats
	start_timer.wait_time = secPerBeat
	start_timer.start()

func _on_start_timer_timeout():
	songPositionInBeats += 1
	if songPositionInBeats < beatsBeforeStart - 1:
		start_timer.start()
	elif songPositionInBeats == beatsBeforeStart - 1:
		start_timer.wait_time = start_timer.wait_time - (AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency())
		start_timer.start()
	else:
		play()
		start_timer.stop()
	_report_beat()
