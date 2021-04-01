# Alex Broz
# VT USL
# Functions to facilitate sending serial commands to Storm32

# * Startsign: 0xFA for incoming messages, and 0xFB for outgoing messages
# * Length: length of the payload, i.e. number of bytes of the data packet excluding
#            Start sign, Length byte, Command byte, and crc word
# * Command: the command byte
# * Payload: as many bytes as expected by the command
# * Checksum: x25 16-bit crc excluding start byte

import crcmod.predefined
import struct

crc = crcmod.predefined.mkCrcFun('crc-16-mcrf4xx')

class storm:
    def __init__(self, _ser):
        # default to version message
        self.startsign = 0xFA
        self.length = 0x00
        self.command = 0x01
        self.payload = bytearray()
        self.checksum = 0xE131
        self.message = bytearray()
        self.port = _ser
        self.incoming = bytearray()
        self.roll = float(0)
        self.pitch = float(0)
        self.yaw = float(0)

    def calcChecksum(self):
        self.checksum = crc(self.message)

    def createMsg(self):
        # TODO: try struct.pack()
        # start putting the message together
        self.message = self.startsign.to_bytes(1, byteorder='little')
        self.message += self.length.to_bytes(1, byteorder='little')
        self.message += self.command.to_bytes(1, byteorder='little')
        self.message += self.payload

        # calculate checksum and add it to message
        self.calcChecksum()
        self.message += self.checksum.to_bytes(2, byteorder='little')

    def send(self):
        self.createMsg()
        self.port.write(self.message)

    def receive(self):
        self.incoming = self.port.read_until()
        print(self.incoming.hex())

    def askRPY(self):
        self.roll = float(input('Roll (deg): '))
        self.pitch = float(input('Pitch (deg): '))
    
    def setRPY(self):
        self.startsign = 0xFA
        self.command = 0x11
        self.payload = struct.pack("fff",self.pitch, self.roll, self.yaw)
        
        self.payload += bytearray.fromhex('00')
        self.payload += bytearray.fromhex('00')
        self.setLength()


    def setLength(self):
        self.length = len(self.payload)