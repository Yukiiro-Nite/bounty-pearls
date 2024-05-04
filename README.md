# Bounty Pearls
*overview about bounty pearls*

*cool image here*

## Recipes

### Bounty Pearl
*image of bounty pearl recipe*

## Credits
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