scoreboard objectives add sqrt dummy
scoreboard players set ?zero sqrt 0
$scoreboard players set ?input_1 sqrt $(input_1)
scoreboard players operation ?input_1 sqrt > ?zero sqrt
scoreboard players set ?out sqrt 0

execute if score ?input_1 sqrt = ?zero sqrt run return 0

function bounty-pearls:sqrt_loop