require = GLOBAL.require
STRINGS = GLOBAL.STRINGS
ACTIONS = GLOBAL.ACTIONS
TUNING = GLOBAL.TUNING

---Tuning---
TUNING.TELESTAFF_USES = GetModConfigData("TELEUSES")
TUNING.TELESTAFF_MOISTURE = GetModConfigData("TELEWET")

---Cast spell on anything---
require "prefabs/telebase"

local function fx(inst, doer, target, actions, right)
    if target.prefab then
        table.insert(actions, ACTIONS.CASTSPELL)
    end
end

AddComponentAction("EQUIPPED", "spellcaster", fx)

local CASTSPELL_fn = ACTIONS.CASTSPELL.fn

ACTIONS.CASTSPELL.fn = function(act)
    local true_or_false = false
    --For use with magical staffs
    local staff = act.invobject or act.doer.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    local act_pos = act:GetActionPoint()
    if staff and staff.components.spellcaster and act.target and act.target.prefab
    then
        staff.components.spellcaster:CastSpell(act.target, act_pos)
        true_or_false = true
    end
    
    return CASTSPELL_fn(act) or true_or_false
end

----Telelocator Staff uses and Rain On/Off----
AddPrefabPostInit("telebase", function(inst)
    local difficultyState = GetModConfigData("TELEBASEGEMUSE")
    
    if difficultyState == 1 then
        function teleport_target(inst)
            for k, v in pairs(inst.components.objectspawner.objects) do
                if v.DestroyGemFn ~= nil then
                    v.DestroyGemFn(v)
                end
            end
        end
    end
    
    if difficultyState == 2 then
        function teleport_target(inst)
            for k, v in pairs(inst.components.objectspawner.objects) do
                if v.DestroyGemFn ~= nil and inst.telecount == 0 then
                    v.DestroyGemFn(v)
                end
            end
            inst.telecount = 1
        end
    end 
        if not GLOBAL.TheWorld.ismastersim then
            return inst
        end
    inst.onteleto = teleport_target
end)