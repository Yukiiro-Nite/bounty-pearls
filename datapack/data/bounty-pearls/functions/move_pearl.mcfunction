function bounty-pearls:clear_target_storage

# store the target data
data modify storage bounty-pearls:target name set from entity @s Item.components.minecraft:custom_name
function bounty-pearls:store_target_pos with storage bounty-pearls:target

# store current data
execute store result storage bounty-pearls:target currentX int 1 run data get entity @s Pos[0]
execute store result storage bounty-pearls:target currentY int 1 run data get entity @s Pos[1]
execute store result storage bounty-pearls:target currentZ int 1 run data get entity @s Pos[2]

function bounty-pearls:calc_pearl_motion with storage bounty-pearls:target

function bounty-pearls:apply_motion with storage bounty-pearls:target

# motion = normalize(@s.pos - targetPlayer.pos) * 0.1