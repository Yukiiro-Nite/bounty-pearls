# Move current out into a temp variable, increment and square it
scoreboard players operation ?tempOut sqrt = ?out sqrt
scoreboard players add ?tempOut sqrt 1
scoreboard players operation ?sqTempOut sqrt = ?tempOut sqrt
scoreboard players operation ?sqTempOut sqrt *= ?tempOut sqrt

# If the temp value is larger than the input square root, we've found the answer and can return.
execute if score ?sqTempOut sqrt > ?input_1 sqrt run return run scoreboard players get ?out sqrt

# Otherwise, update the output values and run again.
scoreboard players operation ?out sqrt = ?tempOut sqrt
function bounty-pearls:sqrt_loop