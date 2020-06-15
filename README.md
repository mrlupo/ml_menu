# ml_menu

# usage
add the following lines :

- inventroy

RegisterNetEvent('player:openinv')
AddEventHandler('player:openinv', function()
    openInventory() 
end)

- personal menu

RegisterNetEvent('pmenuopen')
AddEventHandler('pmenuopen', function()
    WarMenu.OpenMenu('perso') 
end)

- camping menu

RegisterNetEvent('cmenuopen')
AddEventHandler('cmenuopen', function()
    WarMenu.OpenMenu('ml') 
end)

- art horse

RegisterNetEvent('hmenuopen')
AddEventHandler('hmenuopen', function()
    WarMenu.OpenMenu('menu_monturas') 
end)

- police job
(server side)

RegisterServerEvent("redemrp_policejob:checkjob")
AddEventHandler("redemrp_policejob:checkjob", function()
      local _src = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _src, function(user)
print(user.getJob())
        if user.getJob() == 'police' then
            TriggerClientEvent('redemrp_policejob:open', _src)
        else
            print('not authorized')
        end
    end)
end)

(client side)

RegisterNetEvent('redemrp_policejob:open')
AddEventHandler('redemrp_policejob:open', function(cb)
	WarMenu.OpenMenu('leomenu')
	print ("openmenu")
end)

- doctor job

nothing to change if using ml_docotrjob
if using somthing else do same as police but change names


- then remove the keys to open them in each script.
