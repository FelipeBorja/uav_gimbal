# Test commands for storm32 gimbal controller
# Alex Broz
# VT USL

# TODO: move initial serial test to init in storm.py
# TODO: add basic commands for storm32 serial interface:
#       CMD_SETPITCHROLLYAW (#18)
#       CMD_SETANGLES (#17)
#       CMD_SETPANMODE (#13)
#       CMD_ACTIVEPANMODESETTING (#100)

import serial
from storm import *
import sys

ser = serial.Serial(port = '/dev/ttyACM0', baudrate=9600, timeout = 1)  # open serial port

# start with checking if board is connected
ser.write(b't')
packet_in = ser.read_until(b'o')
if packet_in != b'o':
    print('Board not connected. Error:')
    print(packet_in)
    sys.exit()
else:
    print('Board connected')

# Send version message
interface = storm(ser)
interface.send()
interface.receive()

end = False

while not end:
    # get roll pitch yaw from user
    interface.askRPY()
    interface.setRPY()
    interface.send()
    interface.receive()
    end = True
    if(input('Continue? (y/n) ') == 'y'):
        end = False

ser.close()             # close port