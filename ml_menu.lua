local menuOn = false

local keybindControls = {
	["B"] = 0x4CC0E2FE
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local keybindControl = keybindControls["B"]
        if IsControlJustReleased(0, keybindControl) then
            menuOn = true
            SendNUIMessage({
                type = 'init',
                resourceName = GetCurrentResourceName()
            })
           -- SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
            while menuOn == true do Citizen.Wait(100) end
            Citizen.Wait(100)
            while IsControlJustReleased(0, keybindControl) do Citizen.Wait(100) end
        end
    end
end)

RegisterNUICallback('closemenu', function(data, cb)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    cb('ok')
end)


RegisterNUICallback('openmenu', function(data)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    if data.id == 'inventory' then
        TriggerEvent("player:openinv")
    elseif data.id == 'billing' then
        TriggerEvent("pmenuopen")
    elseif data.id == 'dance' then
        TriggerEvent("cmenuopen")
        print('dance!')
    elseif data.id == 'id' then
        TriggerEvent("hmenuopen")
    elseif data.id == 'work' then
		TriggerEvent("hmenuopen")
    elseif data.id == 'phone' then
        TriggerServerEvent("ml_doctorjob:checkjob")
		Wait(0)
		TriggerServerEvent("redemrp_policejob:checkjob")
    end


end)
-- Callback function for testing
RegisterNUICallback('testprint', function(data, cb)
    -- Print message
    TriggerEvent('chatMessage', "[test]", {255,0,0}, data.message)

    -- Send ACK to callback function
    cb('ok')
end)
