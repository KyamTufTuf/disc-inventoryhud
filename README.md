# [ESX] [DISC] disc-inventoryhud
The ACTUAL real code for the inventoryhud that is not broken

# Install
To install the feature just put in your resources folder and do the steps below

# DB Installation
Run the discinventory.sql to create all tables

# Inventory Usage and Installation
For you to create items you have to use the disc_inventory_itemdata table and no longer the "items" table, at least for now that Disc doesn't change, I don't even know if it will change, you must create the items in this image format below

https://prnt.sc/qeruwc

# Es_extendend giveitem Changes

in es_extended > server > commands.lua

Search for:

Before:
```lua
TriggerEvent('es:addGroupCommand', 'giveitem', 'admin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local item    = args[2]
	local count   = (args[3] == nil and 1 or tonumber(args[3]))

	if count ~= nil then
		if xPlayer.getInventoryItem(item) ~= nil then
			xPlayer.addInventoryItem(item, count)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_item'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = _U('giveitem'), params = {{name = 'id', help = _U('id_param')}, {name = 'item', help = _U('item')}, {name = 'amount', help = _U('amount')}}})
```
After:

```lua
TriggerEvent('es:addGroupCommand', 'giveitem', 'admin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local item    = args[2]
	local count   = (args[3] == nil and 1 or tonumber(args[3]))

	if count ~= nil then
		TriggerEvent("disc-inventoryhud:addItem", xPlayer.source, item, count)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = _U('giveitem'), params = {{name = 'id', help = _U('id_param')}, {name = 'item', help = _U('item')}, {name = 'amount', help = _U('amount')}}})
```

# Required
```
es_extended
disc-base
```
# BETA

This is a beta version. NOT all features are present AND THIS IS NOT PRODUCTION READY.
