local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")

local function checklisting(uid, gems, item, version, shiny, amount, username, playerid, class)
    gems = tonumber(gems)

   if item == "Chest Mimic" and gems <= 200000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	
   elseif item == "Diamond Chest Mimic" and gems <= 250000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Fortune" and gems <= 100000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Lucky Block" and gems <= 100000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Massive Commet" and gems <= 100000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
		
   elseif item == "Crystal Key" and gems <= 15000 then
        task.wait(3.01)
          game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Crystal Key Upper Half" and gems <= 10000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Crystal Key Lower Half" and gems <= 5000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Spinny Wheel Ticket" and gems <= 5000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Booth Slot Voucher" and gems <= 25000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
   
   elseif item == "Bonus" and gems <= 20000 then
	task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif item == "Charm Stone" and gems <= 40000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif class == "Enchant" and string.find(item, "VI") and gems <= 25000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
  
   elseif class == "Enchant" and string.find(item, "VII") and gems <= 75000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

   elseif string.find(item, "Potion VII") and gems <= 25000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)

  elseif string.find(item, "Potion VIII") and gems <= 100000 then
        task.wait(3.01)
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)


        
    end
end


Booths_Broadcast.OnClientEvent:Connect(function(username, message)
    local playerID = message['PlayerID']
    if type(message) == "table" then
        local listing = message["Listings"]
        for key, value in pairs(listing) do
            if type(value) == "table" then
                local uid = key
                local gems = value["DiamondCost"]
                local itemdata = value["ItemData"]

                if itemdata then
                    local data = itemdata["data"]

                    if data then
                        local item = data["id"]
                        local version = data["pt"]
                        local shiny = data["sh"]
                        local amount = data["_am"]
                        local class = itemdata['class']
                        checklisting(uid, gems, item, version, shiny, amount, username , playerID, class)
                    end
                end
            end
        end
    end
end)
