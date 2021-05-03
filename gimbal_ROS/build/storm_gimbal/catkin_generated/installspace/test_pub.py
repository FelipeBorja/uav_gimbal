#!/usr/bin/env python3
# Send ROS messages to control gimbal
# Alex Broz
# VT USL

import serial
from storm_gimbal import *
import rospy
from storm_gimbal.msg import gimbal

def talker():
    # ROS publisher setup
    pub = rospy.Publisher('gimbal', gimbal, queue_size = 10)
    rospy.init_node('Test_publisher')
    message = gimbal()

    stop = False
    while not rospy.is_shutdown() and stop == False:
        # get roll pitch yaw from user
        message.roll = float(input("Roll (Deg): "))
        message.pitch = float(input("Pitch (Deg): "))
        
        pub.publish(message)
        if(input("Continue (y/n): ") != "y"):
            stop = True

if __name__ == '__main__':
    try:
        talker()

    except rospy.ROSInterruptException:
        pass