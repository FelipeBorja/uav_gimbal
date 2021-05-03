#!/usr/bin/env python
# Control storm32 gimbal based on incoming ROS messages
# Alex Broz
# VT USL

import serial
from storm_gimbal.storm import *
import rospy
from storm_gimbal.msg import gimbal

# Create gimbal interface
ser = serial.Serial(port = '/dev/ttyACM0', baudrate=9600, timeout = 1)  # open serial port
interface = storm(ser)

def callback(data):
    print("hello there")
    # interface.setRPY(data.roll, data.pitch)
    # interface.rpyMsg()
    # interface.send()
    # interface.receive()

def listener():
    rospy.init_node('gimbal_node', anonymous=True)
    rospy.Subscriber('gimbal', gimbal, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()