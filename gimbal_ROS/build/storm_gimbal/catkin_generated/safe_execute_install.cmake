execute_process(COMMAND "/home/uslpi0/uav_gimbal/gimbal_ROS/build/storm_gimbal/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/uslpi0/uav_gimbal/gimbal_ROS/build/storm_gimbal/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
