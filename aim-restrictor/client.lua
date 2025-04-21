Citizen.CreateThread(function()
    local rollAnims = {
        ["move_jump"] = true,
        ["move_dive"] = true,
        ["move_jump_low"] = true,
        ["move_crouch_proto"] = true,
        ["move_duck"] = true,
    }

    while true do
        local ped = PlayerPedId()
        local isAiming = IsPlayerFreeAiming(PlayerId()) -- Check if the player is aiming
        local isArmed = IsPedArmed(ped, 6) -- Check if the player is armed
        local waitTime = 1000 -- Default idle wait (chill mode)

        -- Adjust wait time based on state
        if isArmed then
            waitTime = 100 -- When armed, react faster
        end

        if isAiming and isArmed then
            waitTime = 0 -- No delay when aiming and armed
        end

        -- If in vehicle, running, or in combat, set shorter wait
        if IsPedInAnyVehicle(ped, false) or IsPedRunning(ped) or IsPedInCombat(ped, 0) then
            waitTime = 250 -- Semi-alert state, still relatively fast
        end

        -- Block specific controls when armed and aiming (including barely aiming state)
        if isArmed then
            -- Disable controls for jumping, rolling, sprinting, stealth, and melee
            DisableControlAction(0, 22, true) -- Jump (SPACE)
            DisableControlAction(0, 44, true) -- Roll (Q)
            DisableControlAction(0, 21, true) -- Sprint (SHIFT)
            DisableControlAction(0, 36, true) -- Stealth (CTRL)
            DisableControlAction(0, 140, true) -- Melee (LMB)
            DisableControlAction(0, 141, true) -- Melee alternate (RMB)
            DisableControlAction(0, 142, true) -- Melee block (F)
            DisableControlAction(0, 143, true) -- Dodge (CTRL)

            -- Block roll and jump-like behavior even if barely aiming
            if IsPedOnFoot(ped) then
                -- Block jump and roll attempts during aiming or idle aiming states
                if IsPedJumping(ped) or IsPedFalling(ped) or IsPedRagdoll(ped) then
                    ClearPedTasksImmediately(ped)
                elseif IsPedRunning(ped) then
                    -- Block rolling attempts while running
                    ClearPedTasksImmediately(ped)
                else
                    -- Block roll animations immediately during aiming (even barely aiming)
                    local currentAnim = GetEntityAnimDict(ped)
                    if rollAnims[currentAnim] then
                        ClearPedTasksImmediately(ped)
                    end
                end
            end

            waitTime = 0 -- Ensure this loop runs without delay when in combat

        elseif isArmed then
            -- If armed but not aiming, wait a little longer
            waitTime = 100
        end

        Citizen.Wait(waitTime)
    end
end)

-- Utility function to get current animation dictionary (with fallback)
function GetEntityAnimDict(ped)
    local animDict = ""
    -- Check if the ped is playing any of the roll-related animations
    if IsEntityPlayingAnim(ped, "move_jump", "jump_air", 3) then
        animDict = "move_jump"
    elseif IsEntityPlayingAnim(ped, "move_dive", "dive_start", 3) then
        animDict = "move_dive"
    elseif IsEntityPlayingAnim(ped, "move_jump_low", "jump_low", 3) then
        animDict = "move_jump_low"
    elseif IsEntityPlayingAnim(ped, "move_crouch_proto", "crouch_proto", 3) then
        animDict = "move_crouch_proto"
    elseif IsEntityPlayingAnim(ped, "move_duck", "duck", 3) then
        animDict = "move_duck"
    end
    return animDict
end
