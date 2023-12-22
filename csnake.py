from ctypes import CDLL, Structure, c_int, POINTER

class Pos(Structure):
	_fields_ = [("x", c_int), ("y", c_int)]

csnake_lib = CDLL('./csnake/build/csnake.so')