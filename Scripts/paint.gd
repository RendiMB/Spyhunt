extends Node2D

 
var currentColor = Color("000000")
var socket = WebSocketPeer.new()

func _ready():
	socket.connect_to_url("wss://localhost:2000/socket.io/?EIO=4&transport=websocket")

func _process(delta):
	socket.poll()
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			pass

func addLine(start, end, Color):
	var line = Line2D.new()
	line.add_point(start)
	line.add_point(end)
	line.default_color = Color("000000")
	line.default_color = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	add_child(line)
	

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		var start = event.position - event.relative
		var end = event.position
		addLine(start,end, currentColor)
		socket.send_text('42["drawing",{'+
			'"x":'+str(start.x)+
			',"y":'+str(start.y)+
			',"x2":'+str(end.x)+
			',"y2":'+str(end.y)+
			',"color":"'+str(currentColor)+'"}]')



func color_changed(value: float) -> void:
	var NewColor = Color(%R.value/255,%G.value/255,%B.value/255)
	$Color/ColorRect.color = NewColor
