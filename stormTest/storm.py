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
    # initialize attributes and test serial connection
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
    
        # start with checking if board is connected
        self.port.write(b't')
        packet_in = self.port.read_until(b'o')
        if packet_in != b'o':
            print('Board not connected. Error:')
            print(packet_in)
        else:
            print('Board connected')

    # calculate and return checksum for serial messages
    def calcChecksum(self, message_nocrc):
        self.checksum = crc(message_nocrc)

    # combine all message fields into an appropriately formatted byte array
    def createMsg(self):
        # start putting the message together
        self.message = struct.pack('BBB',self.startsign,self.length,self.command) + self.payload
        print('Outgoing message:')
        print(self.message.hex())

        # calculate checksum and add it to message
        self.calcChecksum(self.message[1:self.length+3])
        self.message += self.checksum.to_bytes(2, byteorder='little')

    # send message
    def send(self):
        self.createMsg()
        self.port.write(self.message)

    # get incoming message - will delay program until its done
    def receive(self):
        self.incoming = self.port.read_until()
        print('Incoming message:')
        print(self.incoming.hex())
        
        # verify incoming checksum
        self.calcChecksum(self.incoming[1:-2])
        if not self.incoming[-2:] == self.checksum.to_bytes(2, byteorder='little'):
            print('Invalid checksum on incoming message')
        
        # if the message is ACK (150), make sure there are no errors
        if self.incoming[2] == 150 and not self.incoming[3] == 0:
            print(self.ackData(self.incoming[3]))
            
        
    # user (terminal) input gimbal angles
    def askRPY(self):
        self.roll = float(input('Roll (deg): '))
        self.pitch = float(input('Pitch (deg): '))

    # set gimbal angles
    def setRPY(self, roll, pitch):
        self.roll = roll
        self.pitch = pitch

    # setup "setangles" (#17) message
    def rpyMsg(self):
        self.startsign = 0xFA
        self.command = 0x11
        self.payload = struct.pack("fff",self.pitch, self.roll, self.yaw)
        
        # flags and type bytes
        self.payload += bytearray.fromhex('00')
        self.payload += bytearray.fromhex('00')
        self.setLength()

    # determine payload length
    def setLength(self):
        self.length = len(self.payload)

    # determine what the ACK data means
    def ackData(self, data):
        switch = {
            0 : "SERIALRCCMD_ACK_OK",
            1 : "SERIALRCCMD_ACK_ERR_FAIL",
            2 : "SERIALRCCMD_ACK_ERR_ACCESS_DENIED",
            3 : "SERIALRCCMD_ACK_ERR_NOT_SUPPORTED",
            150 : "SERIALRCCMD_ACK_ERR_TIMEOUT",
            151 : "SERIALRCCMD_ACK_ERR_CRC",
            152 : "SERIALRCCMD_ACK_ERR_PAYLOADLEN",
        }

        return switch.get(data)
