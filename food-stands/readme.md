# food-stands
Simple Food Stand script for ESX or QBCore

# Preview:

# ESX Instalation:
Add image in your inventory

Add this to your SQL:

```sql
INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('fs_hotdog', 'Hotdog', 1),
	('fs_burger', 'Burger', 1),
	('fs_water', 'Water', 1),
	('fs_kurkakola', 'Kurka Kola', 1);
```

# ox-inventory use this

Go to your ox-inventory/data/items.lua and add items
```lua
	["fs_hotdog"] = {
		label = "Hotdog",
		weight = 0.1,
		stack = true,
		close = 1,
	},
	["fs_burger"] = {
		label = "Burger",
		weight = 0.1,
		stack = true,
		close = 1,
	},
	["fs_water"] = {
		label = "Water",
		weight = 0.1,
		stack = true,
		close = 1,
	},
	["fs_kurkakola"] = {
		label = "Kurka Kola",
		weight = 0.1,
		stack = true,
		close = 1,
	},
```


# QBCore Instalation:
Add image in your inventory / QBCore.. qb-inventory/html/images

Add this to your qb-core/shared/items.lua:
```lua
	-- food-stands
	["fs_hotdog"]  	= {["name"] = "fs_hotdog", 			["label"] = "Hotdog", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "fs_hotdog.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["fs_burger"]  	= {["name"] = "fs_burger", 			["label"] = "Burger", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "fs_burger.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["fs_water"]  	= {["name"] = "fs_water", 			["label"] = "Water", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "fs_water.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["fs_kurkakola"]  	= {["name"] = "fs_kurkakola", 			["label"] = "Cola", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "fs_kurkakola.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
```

# Dependicies
- oxtarget or qbtarget
- esx or qbcore
- rpemotes