#!/bin/bash

echo "TODO: install SDK, cancel out of config MPA wizard when prompted"

_setup_cameras() {
	# prime the system with this to allow us to setup systemd via voxl-configure-cameras
	# this does have IMX412 on J6 Lower which we want... Boson not supported in -c at this point
	adb push custom_camera_config.txt /data/modalai/

	adb shell "voxl-configure-cameras custom"
	adb push voxl-camera-server.conf /etc/modalai/

	adb shell "cp /usr/share/modalai/chi-cdk/boson/com.qti.sensormodule.boson_2.bin /usr/lib/camera"
	adb shell "rm /usr/lib/camera/com.qti.sensormodule.ov7251_2.bin"
}

_setup_hearlink() {
	adb shell "voxl-configure-streamer factory_enable"
	# if customization needed, update conf and enable line below 
	# adb push voxl-streamer.conf /etc/modalai/

	adb shell "voxl-configure-mavlink-server factory_enable"
	
	# copy over customization for hearlink IP -> primary_static_gcs_ip
	adb push voxl-mavlink-server.conf/etc/modalai/
}

_setup_cameras
echo "raven camera config setup complete"

_setup_hearlink
echo "raven herelink setup complete"
