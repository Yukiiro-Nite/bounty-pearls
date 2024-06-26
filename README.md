# Bounty Pearls
This Minecraft data pack introduces a new item called the Bounty Pearl. Players can use these pearls to track down other players within the game world. By renaming the Bounty Pearl in an anvil to the name of the desired player, users can then throw the pearl to initiate tracking.

![A thrown bounty pearl](screenshots/thrown_bounty_pearl.png)

## Recipes

### Bounty Pearl
![Bounty pearl recipe, a skull with an eye of ender on each side.](screenshots/bounty_pearl_recipe.png)
- After you create the pearl, you need to rename it in an anvil to the name of the player you want to track.

## Credits, links, and thoughts
### Getting started, crafting, and custom model data
- [Introduction to Datapacks - Minecraft Datapack Tutorial EP 1](https://www.youtube.com/watch?v=ePDn1g5woC4&list=PL01VhHmiNQ5oJ-0hoZvrJd2j9Ol7-Isim&index=1&t=1s&pp=iAQB)
- [Custom Recipes - Minecraft Datapack Tutorial EP 2](https://www.youtube.com/watch?v=Uq2cbgeLssU&list=PL01VhHmiNQ5oJ-0hoZvrJd2j9Ol7-Isim&index=3)
- [How to ADD Custom Items to Minecraft in 1.19.3+ Datapack Tutorial](https://www.youtube.com/watch?v=_VQEimQJTUA)
- [How to Add Custom Recipes to Minecraft Datapack Tutorial](https://www.youtube.com/watch?v=IYfbnJHR9jQ)
  - Discovered that most of the extra work in this video isn't needed any longer, we can define components on recipe results now.
- NOTE: There were some changes in 1.20.5 that are not covered in the tutorials above.
  - For example, a recipe result now takes an id instead of an item
  - loot table functions now use `"function": "minecraft:set_custom_model_data"` instead of `set_nbt` to set the model id.
  - Apparently you must deploy your datapack and resourcepack separately. This is why my textures didn't work at first.
- [Minecraft Wiki - Data pack](https://minecraft.wiki/w/Data_pack)
- [Advancement generator](https://misode.github.io/advancement/)
- [Loot table generator](https://misode.github.io/loot-table/)
- [Recipes generator](https://misode.github.io/recipe/)
- [Blockbench](https://www.blockbench.net/)
- [Give command generator](https://mcstacker.net/)

### Functionality & tracking players
- Used the advancement generator above to generate an advancement that triggers when a player uses bounty pearl (eye of ender with custom model data)
- Created a mcfunction that triggers when the above advancement is detected, and clears the advancement so the player can trigger it again.
- [Functions! - Minecraft Datapack Tutorial EP 4](https://www.youtube.com/watch?v=IGIwf7ZcUTg&list=PL01VhHmiNQ5oJ-0hoZvrJd2j9Ol7-Isim&index=4)
- In the `throw_bounty_pearl` function, we can tag the nearest eye of ender as a `bounty-pearl`
- Later, in a function run on tick, we can select all bounty pearls and run a function on them to update their motion
- Seems like I'll need to use execute store to get the target player's information
  - execute store only works with number values
  - If you need something besides number values, use data modify storage
- We can use information from storage in a macro to do things dynamically (including with strings)
  - Apparently I need to use execute store instead of data modify for values that will later be used in scoreboards so I can cast values to int
    - Why does this have to be so complicated?
