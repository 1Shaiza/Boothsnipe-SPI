local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")

local function checklisting(uid, gems, item, version, shiny, amount, username, playerid, class)
    gems = tonumber(gems)

      if item == "Chest Mimic" and price <= 200000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	
   elseif item == "Diamond Chest Mimic" and price <= 250000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Fortune" and price <= 100000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Lucky Block" and price <= 100000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Massive Commet" and price <= 100000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Crystal Key" and price <= 15000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Crystal Key Upper Half" and price <= 10000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Crystal Key Upper Half" and price <= 5000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Spinny Wheel Ticket" and price <= 5000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Booth Slot Voucher" and price <= 25000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

   elseif item == "Charm Stone" and price <= 40000 then
        task.wait(3.05)
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)

        
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
