import socket
import os

UDP_IP = "0.0.0.0"
UDP_PORT = int(os.environ['UDPPORT'])

print("Listening on UDP port", UDP_PORT)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

while True:
    data, addr = sock.recvfrom(1024)
    print(data.decode('utf-8'))
