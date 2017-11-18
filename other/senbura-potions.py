from com.android.monkeyrunner import MonkeyRunner, MonkeyDevice
device = MonkeyRunner.waitForConnection()

def setQuantity(qty):
	MonkeyRunner.sleep(0.5)
	# set quantity
	for i in range(0, qty):
	    device.touch(1698, 788, 'DOWN_AND_UP')
	    MonkeyRunner.sleep(0.03)
	# confirm
	device.touch(1446, 1028, 'DOWN_AND_UP')
	MonkeyRunner.sleep(0.5)
	return

# get rid of stat up notif
device.touch(950, 1120, 'DOWN_AND_UP')
MonkeyRunner.sleep(0.5)
# go to potions screen
device.touch(950, 1120, 'DOWN_AND_UP')
MonkeyRunner.sleep(2.0)

# pink potion
device.touch(312, 479, 'DOWN_AND_UP')
setQuantity(125)
# blue potion
device.touch(2060, 479, 'DOWN_AND_UP')
setQuantity(225)
# yellow potion
device.touch(589, 1007, 'DOWN_AND_UP')
setQuantity(225)
# green potion
device.touch(1816, 1007, 'DOWN_AND_UP')
setQuantity(125)

# submit
device.touch(1198, 1267, 'DOWN_AND_UP')
MonkeyRunner.sleep(4.0)
# click after potion shows up
device.touch(1198, 1267, 'DOWN_AND_UP')

# scene
MonkeyRunner.sleep(10.0)
# menu
device.touch(1816, 1007, 'DOWN_AND_UP')
MonkeyRunner.sleep(0.5)
# skip
device.touch(1750, 670, 'DOWN_AND_UP')
MonkeyRunner.sleep(1.0)
# confirm skip
device.touch(1500, 1000, 'DOWN_AND_UP')
