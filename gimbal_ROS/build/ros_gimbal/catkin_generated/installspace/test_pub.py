#!/usr/bin/env python3
# Send ROS messages to control gimbal
# Alex Broz
# VT USL

import serial
from storm import *
import rospy
from ros_gimbal.msg import gimbal

def talker():
    # ROS publisher setup
    pub = rospy.Publisher('gimbal', gimbal, queue_size = 10)
    rospy.init_node('Test publisher')
    message = gimbal()

    while not rospy.is_shutdown():
        # get roll pitch yaw from user
        message.roll = input("Roll (Deg): ")
        message.pitch = input("Pitch (Deg): ")
        
        pub.publish(msg)

if __name__ == '__main__':
    try:
        talker()

    except rospy.ROSInterruptException:
        pass