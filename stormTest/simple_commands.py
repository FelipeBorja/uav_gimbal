# View basic data from storm32 gimbal controller
# Alex Broz
# VT USL

# http://www.olliw.eu/storm32bgc-wiki/Serial_Communication#Serial_Communication_-_Simple_Commands
# 't' - This command simply returns the character 'o'. Can be used by the host to check if the board is still connected.
# 'v' - This command returns information on the installed firmware version, the name of the board, and the type of the board. The data stream is appended by a crc, and closed with the character 'o'.
# 'g' - This command returns a data stream containing all parameter values. The data stream is appended by a crc, and closed with the character 'o'.
# 'p' - This command sets all parameter values. The command character 'p' needs to be followed by a data stream containing all parameter values, plus a crc. It returns the character 'o'.
# 'd' - Upon receipt of the command 'd' a data stream containing the current live data is transmitted.
# 's' - Upon receipt of the command 's' a data stream containing the current status data is transmitted. The data stream is appended by a crc, and closed with the character 'o'. 

import serial
import crcmod.predefined

ser = serial.Serial('/dev/ttyACM0')  # open serial port

command = 't'   # start with checking if board is connected

# run until input 'space'
while command != ' ':
    ser.write(command.encode())
    data = ser.read_until('o'.encode())
    print(data.hex())
    print(data)
    command = input('Command:')

ser.close()             # close port

crc = crcmod.predefined.Crc('crc-16-mcrf4xx')

crc.update(b'\x01\x96\x00')
print(hex(crc.crcValue))
print('62 2e')