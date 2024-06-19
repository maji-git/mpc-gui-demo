extends Control

@export var mpc: MultiPlayCore
@export var host_btn: Button
@export var join_btn: Button
@export var address_bar: LineEdit

@export var button_layout: Control
@export var connecting_layout: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	# Register Button Press Signals
	host_btn.pressed.connect(host_game)
	join_btn.pressed.connect(join_game)
	
	# Hide UI if client were connected
	mpc.connected_to_server.connect(_on_connected_to_server)

# When host game requested
func host_game():
	mpc.start_online_host(true)
	open_connecting_ui()

# When join game requested
func join_game():
	# Pass URL from address bar to MPC
	var url = address_bar.text
	mpc.start_online_join(url)
	open_connecting_ui()

# Open Connecting UI Layout
func open_connecting_ui():
	button_layout.visible = false
	connecting_layout.visible = true

# Close UI when connected to server
func _on_connected_to_server(_plr):
	visible = false
