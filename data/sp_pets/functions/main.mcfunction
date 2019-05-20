# set scoreboard
execute at @s if entity @e[type=item,nbt={Item:{id:"minecraft:bone"}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:poppy"}},distance=..1] if entity @e[type=minecraft:wolf,distance=..1] run scoreboard players set @s sp_pets_transfer 1
execute at @s if entity @e[type=item,nbt={Item:{id:"minecraft:cod"}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:poppy"}},distance=..1] if entity @e[type=minecraft:cat,distance=..1] run scoreboard players set @s sp_pets_transfer 2
execute at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:poppy"}},distance=..1] if entity @e[type=minecraft:parrot,distance=..1] run scoreboard players set @s sp_pets_transfer 3

#if scoreboard is 1, wolf
execute as @s if score @s sp_pets_transfer matches 1..1 run data modify entity @e[type=wolf,distance=..1,limit=1] OwnerUUID set from entity @s Item.tag.SkullOwner.Id
execute as @s if score @s sp_pets_transfer matches 1..1 run kill @e[type=item,nbt={Item:{id:"minecraft:bone"}},distance=..1]

#if scoreboard is 2, cat
execute as @s if score @s sp_pets_transfer matches 2..2 run data modify entity @e[type=cat,distance=..1,limit=1] OwnerUUID set from entity @s Item.tag.SkullOwner.Id
execute as @s if score @s sp_pets_transfer matches 2..2 run kill @e[type=item,nbt={Item:{id:"minecraft:cod"}},distance=..1]

#if scoreboard is 3, parrot
execute as @s if score @s sp_pets_transfer matches 3..3 run data modify entity @e[type=parrot,distance=..1,limit=1] OwnerUUID set from entity @s Item.tag.SkullOwner.Id
execute as @s if score @s sp_pets_transfer matches 3..3 run kill @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}},distance=..1]

#make hearts
execute as @s if score @s sp_pets_transfer matches 1..4 run execute at @s run particle minecraft:heart
execute as @s if score @s sp_pets_transfer matches 1..4 run execute at @s run particle minecraft:heart
execute as @s if score @s sp_pets_transfer matches 1..4 run execute at @s run particle minecraft:heart

# reset scoreboard
execute as @s if score @s sp_pets_transfer matches 1..4 run kill @e[type=item,nbt={Item:{id:"minecraft:poppy"}},distance=..1]
execute as @s if score @s sp_pets_transfer matches 1..4 run kill @s
execute as @s if score @s sp_pets_transfer matches 1..4 run scoreboard players set @s sp_pets_transfer 0