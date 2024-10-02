ESX = exports["es_extended"]:getSharedObject()


--- removed our code and updated ka5 store serverside to work with ours (built it together)

ESX.RegisterServerCallback('shops:LoadStoreData', function(source, cb, DisplayName)
	if not Config.Storelist[DisplayName].inuse or Config.Storelist[DisplayName].inuse == source then
		local xPlayer = ESX.GetPlayerFromId(source)
		local shopItemCount = LoadData(DisplayName)
		local itemsWithInventoryCount = Config.Storelist[DisplayName].items
		for k, v in pairs(itemsWithInventoryCount) do
			if xPlayer.getInventoryItem(k) then
				itemsWithInventoryCount[k].inventoryCount = xPlayer.getInventoryItem(k).count
				if shopItemCount[k] ~= nil then
					itemsWithInventoryCount[k].count = shopItemCount[k].count
				else
					itemsWithInventoryCount[k].count = 0
				end
			else
			end
		end
		cb(true, Config.Storelist[DisplayName], itemsWithInventoryCount, xPlayer.job.name)
	else
		cb(false)
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	
	for k, v in pairs(Config.Storelist) do
		if v.locked == source then
			Config.Storelist[k].locked = nil
		end
	end
end)


local shopCountData = {}

function LoadData(DisplayName)
	local loadFile = json.decode(LoadResourceFile(GetCurrentResourceName(), "./data/"..DisplayName..".json"))

	if loadFile == nil then
		for k, v in pairs(Config.Storelist[DisplayName].items) do
			shopCountData[k] = {}
			shopCountData[k].count = v.Defaultamount 
		end
		SaveResourceFile(GetCurrentResourceName(), "./data/"..DisplayName..".json", json.encode(shopCountData), -1)
	else
		shopCountData = loadFile
		for k, v in pairs(Config.Storelist[DisplayName].items) do
			if shopCountData[k] == nil then
				shopCountData[k] = {}
				shopCountData[k].count = v.Defaultamount
			end
		end
	end

	return shopCountData
end

function SaveData(DisplayName, data)
	SaveResourceFile(GetCurrentResourceName(), "./data/"..DisplayName..".json", json.encode(data), -1)
end



RegisterServerEvent("shops:Moneycheck")
AddEventHandler("shops:Moneycheck", function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	if data.PaymentID == 1 then
		if xPlayer.getAccount('money').money < data.price then
			NotifiServ(source, { title = Config.title, text = Text('notenoughmoney'), icon = 'fa-solid fa-basket-shopping', color = '#ff0000' })
			TriggerClientEvent('shops:CloseStore', source)
		else
			TriggerEvent("shops:buy", source, data, 'money')
		end
	elseif data.PaymentID == 2 then
		if xPlayer.getAccount('bank').money <data.price then
			NotifiServ(source, { title = Config.title, text = Text('notenoughmoneyinbank'), icon = 'fa-solid fa-basket-shopping', color = '#ff0000' })
			TriggerClientEvent('shops:CloseStore', source)
		else
			TriggerEvent("shops:buy", source, data, 'bank')
		end
	elseif data.PaymentID == 3 then
		if xPlayer.getAccount('black_money').money <data.price then
			NotifiServ(source, { title = Config.title, text = Text('notenoughblackmoney'), icon = 'fa-solid fa-basket-shopping', color = '#ff0000' })
			TriggerClientEvent('shops:CloseStore', source)
		else
			TriggerEvent("shops:buy", source, data, 'black_money')
		end
    end
end)

RegisterServerEvent("shops:buy")
AddEventHandler("shops:buy", function(playerId, data, account)
	if not Config.Storelist[data.DisplayName].transaction then
		Config.Storelist[data.DisplayName].transaction = true
		local xPlayer = ESX.GetPlayerFromId(playerId)
		local cantCarry = false
		local shopItemCount = LoadData(data.DisplayName)

		for k, v in pairs(data.payData) do
			if xPlayer.canCarryItem(v.name, tonumber(v.amount)) then
				xPlayer.removeAccountMoney(account, tonumber(v.amount) * tonumber(v.price))
				xPlayer.addInventoryItem(v.name, tonumber(v.amount))
				shopItemCount[v.name].count = tonumber(shopItemCount[v.name].count) - tonumber(v.amount)
			else
				cantCarry = true
			end
		end
		SaveData(data.DisplayName, shopItemCount)

		TriggerClientEvent('shops:CloseStore', playerId)
	end
end)

RegisterServerEvent("shops:sell")
AddEventHandler("shops:sell", function(data)
	if not Config.Storelist[data.DisplayName].transaction then
		Config.Storelist[data.DisplayName].transaction = true
		local xPlayer = ESX.GetPlayerFromId(source)
		local cantCarry = false
		local shopItemCount = LoadData(data.DisplayName)
		local account = nil
		local isInJobs = false

		if Config.Storelist[data.DisplayName].sellJob ~= nil then
			for k, v in pairs(Config.Storelist[data.DisplayName].sellJob) do
				if v == xPlayer.job.name then isInJobs = true end
			end
		end

		if Config.Storelist[data.DisplayName].sellJob == nil or isInJobs then
			if data.PaymentID == 1 then
				account = "money"
			elseif data.PaymentID == 2 then
				account = "bank"
			elseif data.PaymentID == 3 then
				account = "black_money"
			end
			if Config.Storelist[data.DisplayName].sellJob == nil then 
				for k, v in pairs(data.payData) do
					xPlayer.removeInventoryItem(v.name, tonumber(v.amount))
					xPlayer.addAccountMoney(account, tonumber(v.amount) * tonumber(v.price))
					shopItemCount[v.name].count = tonumber(shopItemCount[v.name].count) + tonumber(v.amount)
				end
			elseif isInJobs then
				TriggerEvent("esx_addonaccount:getSharedAccount", "society_"..xPlayer.job.name, function(account)
					if account ~= nil then
						for k, v in pairs(data.payData) do
							xPlayer.removeInventoryItem(v.name, tonumber(v.amount))
							account.addMoney(tonumber(v.amount) * tonumber(v.price))
							shopItemCount[v.name].count = tonumber(shopItemCount[v.name].count) + tonumber(v.amount)
						end
					end
				end)
			end

			SaveData(data.DisplayName, shopItemCount)

			TriggerClientEvent('shops:CloseStore', source)
		else
			TriggerClientEvent('shops:CloseStore', source)
			notifySv(source, Config.Locales[Config.Locale].IncorrectJob)
		end
	end
end)


RegisterServerEvent("shops:Toggleinuse")
AddEventHandler("shops:Toggleinuse", function(DisplayName)
	Config.Storelist[DisplayName].inuse = source
end)

RegisterServerEvent("shops:Toggleopen")
AddEventHandler("shops:Toggleopen", function(DisplayName)
	Config.Storelist[DisplayName].inuse = nil
	Config.Storelist[DisplayName].transaction = nil
end)

AddEventHandler('onResourceStop', function(resourceName)
	if resourceName == GetCurrentResourceName() then
		for shopName, shop in pairs(Config.Storelist) do
			if shop.Restartrefresh then
				local shopData = {}
				for k, v in pairs(shop.items) do
					shopData[k] = {}
					shopData[k].count = v.Defaultamount
				end
				SaveData(shopName, shopData)
			end
		end
	end
end)