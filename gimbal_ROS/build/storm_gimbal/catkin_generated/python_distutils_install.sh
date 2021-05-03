#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/uslpi0/uav_gimbal/gimbal_ROS/src/storm_gimbal"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/uslpi0/uav_gimbal/gimbal_ROS/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/uslpi0/uav_gimbal/gimbal_ROS/install/lib/python3/dist-packages:/home/uslpi0/uav_gimbal/gimbal_ROS/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/uslpi0/uav_gimbal/gimbal_ROS/build" \
    "/usr/bin/python3" \
    "/home/uslpi0/uav_gimbal/gimbal_ROS/src/storm_gimbal/setup.py" \
     \
    build --build-base "/home/uslpi0/uav_gimbal/gimbal_ROS/build/storm_gimbal" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/uslpi0/uav_gimbal/gimbal_ROS/install" --install-scripts="/home/uslpi0/uav_gimbal/gimbal_ROS/install/bin"
