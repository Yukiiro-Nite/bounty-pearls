scoreboard objectives add targetMotion dummy
# scoreboard objectives setdisplay sidebar targetMotion

# Scales up the distance values so we have some decimal precision later
scoreboard players set ?scale targetMotion 1000

# Scales down the normalized vector so the pearl doesn't move too fast
scoreboard players set ?motionScale targetMotion 10


# initialize current values
$scoreboard players set ?currentX targetMotion $(currentX)
$scoreboard players set ?currentY targetMotion $(currentY)
$scoreboard players set ?currentZ targetMotion $(currentZ)

# initialize target values
$scoreboard players set ?targetX targetMotion $(targetX)
$scoreboard players set ?targetY targetMotion $(targetY)
$scoreboard players set ?targetZ targetMotion $(targetZ)

# initialize diff
scoreboard players operation ?diffX targetMotion = ?targetX targetMotion
scoreboard players operation ?diffY targetMotion = ?targetY targetMotion
scoreboard players operation ?diffZ targetMotion = ?targetZ targetMotion

# calculate diff
scoreboard players operation ?diffX targetMotion -= ?currentX targetMotion
scoreboard players operation ?diffY targetMotion -= ?currentY targetMotion
scoreboard players operation ?diffZ targetMotion -= ?currentZ targetMotion

# Now that I have a vector from the pearl to the target, I need to normalize this value
# To normalize, we divide the vector by the length of the vector

# First, let's calculate the squared length of the vector
scoreboard players operation ?sqX targetMotion = ?diffX targetMotion
scoreboard players operation ?sqY targetMotion = ?diffY targetMotion
scoreboard players operation ?sqZ targetMotion = ?diffZ targetMotion

scoreboard players operation ?sqX targetMotion *= ?diffX targetMotion
scoreboard players operation ?sqY targetMotion *= ?diffY targetMotion
scoreboard players operation ?sqZ targetMotion *= ?diffZ targetMotion

scoreboard players operation ?sqLen targetMotion = ?sqX targetMotion
scoreboard players operation ?sqLen targetMotion += ?sqY targetMotion
scoreboard players operation ?sqLen targetMotion += ?sqZ targetMotion

# Now we need to get the square root of this value.
# How the fuck do we do that without a sqrt function? Guess I have to write my own.
execute store result storage bounty-pearls:target sqDistance int 1 run scoreboard players get ?sqLen targetMotion
execute store result storage bounty-pearls:math_input input_1 int 1 run data get storage bounty-pearls:target sqDistance
function bounty-pearls:sqrt with storage bounty-pearls:math_input

# If the root is zero, let's set the output to 1 so we don't divide by zero.
execute if score ?out sqrt = ?zero sqrt run scoreboard players set ?out sqrt 1

# Calculate normalized vector, offset by scale for added precision
scoreboard players operation ?normalX targetMotion = ?diffX targetMotion
scoreboard players operation ?normalY targetMotion = ?diffY targetMotion
scoreboard players operation ?normalZ targetMotion = ?diffZ targetMotion

scoreboard players operation ?normalX targetMotion *= ?scale targetMotion
scoreboard players operation ?normalY targetMotion *= ?scale targetMotion
scoreboard players operation ?normalZ targetMotion *= ?scale targetMotion

scoreboard players operation ?normalX targetMotion /= ?out sqrt
scoreboard players operation ?normalY targetMotion /= ?out sqrt
scoreboard players operation ?normalZ targetMotion /= ?out sqrt

# Move normalized values into a motion value, and scale down so the pearl doesn't move too fast.
scoreboard players operation ?motionX targetMotion = ?normalX targetMotion
scoreboard players operation ?motionY targetMotion = ?normalY targetMotion
scoreboard players operation ?motionZ targetMotion = ?normalZ targetMotion

scoreboard players operation ?motionX targetMotion /= ?motionScale targetMotion
scoreboard players operation ?motionY targetMotion /= ?motionScale targetMotion
scoreboard players operation ?motionZ targetMotion /= ?motionScale targetMotion

# Move motion values into global target store
execute store result storage bounty-pearls:target motionX double 0.001 run scoreboard players get ?motionX targetMotion
execute store result storage bounty-pearls:target motionY double 0.001 run scoreboard players get ?motionY targetMotion
execute store result storage bounty-pearls:target motionZ double 0.001 run scoreboard players get ?motionZ targetMotion