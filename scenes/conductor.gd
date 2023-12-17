extends AudioStreamPlayer

# beats per minute
#This is determined by the song you're trying to sync up to
@export var songBpm: int

#The number of seconds for each song beat
var secPerBeat: float

#Current song position, in seconds
var songPosition : float

#Current song position, in beats
var songPositionInBeats : float
var prevSongPositionInBeats : float

# Called when the node enters the scene tree for the first time.
func _ready():
	secPerBeat = 60.0 / songBpm
	prevSongPositionInBeats = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	songPosition =  get_playback_position() - AudioServer.get_time_since_last_mix()
	songPositionInBeats = songPosition / secPerBeat
	if int(songPositionInBeats) != int(prevSongPositionInBeats):
		print(int(songPositionInBeats))
	prevSongPositionInBeats = songPositionInBeats
