local nvg = 0
local thermalg = 0
local wearingfiregear = 0
local wearingscubagear = 0
local wearingbombgear = 0
local notwearinggear = 1
local wearinggearlight = 0
local gearlight = 0
SetNightvision(false)
SetSeethrough(false)

CreateThread(function() -- Makes your props not fall off when ped takes damage.
	while true do
		Wait(0)
		local ped = PlayerPedId()
		if Config.KeepProps == true and DoesEntityExist(ped) and not IsEntityDead(ped) then
			SetPedCanLosePropsOnDamage(ped, false, 0)
		else
			SetPedCanLosePropsOnDamage(ped, true, 0)
		end
	end
end)

CreateThread(function() --Determines if wearing fire gear, scuba gear, bomb gear, or no gear.
    while true do
        Wait(0)
		local ped = PlayerPedId()
        if DoesEntityExist(ped) and not IsEntityDead(ped) then
			local Arms = GetPedDrawableVariation(ped, Config.armspeddrawablevariation)
			local Torso = GetPedDrawableVariation(ped, Config.torsopeddrawablevariation)
			local Undershirt = GetPedDrawableVariation(ped, Config.undershirtpeddrawablevariation)
			local Pants = GetPedDrawableVariation(ped, Config.pantspeddrawablevariation)
			local Shoes = GetPedDrawableVariation(ped, Config.shoespeddrawablevariation)
			local Mask = GetPedDrawableVariation(ped, Config.maskdrawablevariation)
			local Hat = GetPedPropIndex(ped, Config.hatpedpropindex)
			local Glasses = GetPedPropIndex(ped, Config.glassespedpropindex)
			local ismale = IsPedModel(ped,"mp_m_freemode_01")
			local isfemale = IsPedModel(ped,"mp_f_freemode_01")
            if ismale and Torso == Config.mfiretorso and Undershirt == Config.mfireundershirt and Pants == Config.mfirepants and Shoes == Config.mfireshoes and Mask == Config.mfiremask and Hat == Config.mfirehat or isfemale and Torso == Config.ffiretorso and Undershirt == Config.ffireundershirt and Pants == Config.ffirepants and Shoes == Config.ffireshoes and Mask == Config.ffiremask and Hat == Config.ffirehat then -- Fire Gear
				wearingfiregear = 1
				notwearinggear = 0
			elseif ismale and Glasses == Config.mscubagoggles and Undershirt == Config.mscubaundershirt and Shoes == Config.mscubashoes or isfemale and Glasses == Config.fscubagoggles and Undershirt == Config.fscubaundershirt and Shoes == Config.fscubashoes then -- Scuba Gear
				wearingscubagear = 1 
				notwearinggear = 0
			elseif ismale and Hat == Config.mbombhat and Arms == Config.mbombarms and Torso == Config.mbombtorso and Undershirt == Config.mbombundershirt and Pants == Config.mbombpants and Shoes == Config.mbombshoes or isfemale and Hat == Config.fbombhat and Arms == Config.fbombarms and Torso == Config.fbombtorso and Undershirt == Config.fbombundershirt and Pants == Config.fbombpants and Shoes == Config.fbombshoes then -- Bomb Gear
				wearingbombgear = 1 
				notwearinggear = 0
			else
				notwearinggear = 1
            end
        end
    end
end)

CreateThread(function() -- Sets proofs for whatever youre wearing.
	while true do
		Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) then
			if wearingfiregear == 1 and Config.FireGear == true then
				SetEntityProofs(ped, false, true, false, false, false, true, false, false) --Sets ped as fireproof and steamproof
			elseif wearingscubagear == 1 and Config.ScubaGear == true then
				SetEntityProofs(ped, false, false, false, false, false, false, false, true) --Sets ped as drownproof
				--ClearPedTasks(ped) --Stops ped from removing scuba tank
			elseif wearingbombgear == 1 and Config.BombGear == true then
				SetEntityProofs(ped, false, true, true, false, false, true, false, false) --Sets ped as explosionproof, fireproof, and steamproof
			elseif	notwearinggear == 1 then
				SetEntityProofs(ped, false, false, false, false, false, false, false, false) --Removes all proofs
				SetPlayerMeleeWeaponDamageModifier(ped, 1.0) --Returns melee damage to 100%
			end
		end
	end
end)

CreateThread(function() --Functional NVGs
    while true do
        Wait(0)
        if Config.NightVisionGoggles == true and nvg == 0 and IsControlJustPressed(0, Config.goggleKey) then
			local ped = PlayerPedId()
			local Hat = GetPedPropIndex(ped, Config.hatpedpropindex)
			local ismale = IsPedModel(ped,"mp_m_freemode_01")
			local isfemale = IsPedModel(ped,"mp_f_freemode_01")
			if ismale and Hat == Config.mnvgup or isfemale and Hat == Config.fnvgup then
				local HatTex = GetPedPropTextureIndex(ped, Config.hatpedproptextureindex)
				if ismale then 
					SetPedPropIndex(ped, 0, Config.mnvgdown, HatTex, true)
					SetNightvision(true)
					nvg = 1
				elseif isfemale then 
					SetPedPropIndex(ped, 0, Config.fnvgdown, HatTex, true)
					SetNightvision(true)
					nvg = 1
				end
			end
		elseif Config.NightVisionGoggles == true and nvg == 1 and IsControlJustPressed(0, Config.goggleKey) then
			local ped = PlayerPedId()
			local Hat = GetPedPropIndex(ped, Config.hatpedpropindex)
			local ismale = IsPedModel(ped,"mp_m_freemode_01")
			local isfemale = IsPedModel(ped,"mp_f_freemode_01")
			if ismale and Hat == Config.mnvgdown or isfemale and Hat == Config.fnvgdown then
				local HatTex = GetPedPropTextureIndex(ped, Config.hatpedproptextureindex)
				if ismale then 
					SetPedPropIndex(ped, 0, Config.mnvgup, HatTex, true)
					SetNightvision(false)
					nvg = 0
				elseif isfemale then 
					SetPedPropIndex(ped, 0, Config.fnvgup, HatTex, true)
					SetNightvision(false)
					nvg = 0
				end
			end
		else
			Wait(100)
		end
    end
end)

CreateThread(function() --Functional Thermal Goggles
    while true do
        Wait(0)
        if Config.ThermalGoggles == true and thermalg == 0 and IsControlJustPressed(0, Config.goggleKey) then
			local ped = PlayerPedId()
			local Hat = GetPedPropIndex(ped, Config.hatpedpropindex)
			local ismale = IsPedModel(ped,"mp_m_freemode_01")
			local isfemale = IsPedModel(ped,"mp_f_freemode_01")
			if ismale and Hat == Config.mthermalup or isfemale and Hat == Config.fthermalup then
				local HatTex = GetPedPropTextureIndex(ped, Config.hatpedproptextureindex)
				if ismale then 
					SetPedPropIndex(ped, 0, Config.mthermaldown, HatTex, true)
					SetSeethrough(true)
					thermalg = 1
				elseif isfemale then 
					SetPedPropIndex(ped, 0, Config.fthermaldown, HatTex, true)
					SetSeethrough(true)
					thermalg = 1
				end
			end
		elseif Config.ThermalGoggles == true and thermalg == 1 and IsControlJustPressed(0, Config.goggleKey) then
			local ped = PlayerPedId()
			local Hat = GetPedPropIndex(ped, Config.hatpedpropindex)
			local ismale = IsPedModel(ped,"mp_m_freemode_01")
			local isfemale = IsPedModel(ped,"mp_f_freemode_01")
			if ismale and Hat == Config.mthermaldown or isfemale and Hat == Config.fthermaldown then
				local HatTex = GetPedPropTextureIndex(ped, Config.hatpedproptextureindex)
				if ismale then 
					SetPedPropIndex(ped, 0, Config.mthermalup, HatTex, true)
					SetSeethrough(false)
					thermalg = 0
				elseif isfemale then 
					SetPedPropIndex(ped, 0, Config.fthermalup, HatTex, true)
					SetSeethrough(false)
					thermalg = 0
				end
			end
		else
			Wait(100)
		end
    end
end)

CreateThread(function() -- Detects if you are wearing an undershirt that you can control the light of.
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local Undershirt = GetPedDrawableVariation(ped, Config.undershirtpeddrawablevariation)
		local ismale = IsPedModel(ped,"mp_m_freemode_01")
		local isfemale = IsPedModel(ped,"mp_f_freemode_01")
		if DoesEntityExist(ped) and not IsEntityDead(ped) then
			if ismale then
				if Undershirt == Config.mscubaundershirt or Undershirt == Config.mfireundershirt then
					wearinggearlight = 1
				end
			elseif isfemale then
				if Undershirt == Config.fscubaundershirt or Undershirt == Config.ffireundershirt then
					wearinggearlight = 1
				end
			else
				wearinggearlight = 0
			end
		end
	end
end)

CreateThread(function() -- Lets you press a key to toggle the gear light on or off.
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local Undershirt = GetPedDrawableVariation(ped, Config.undershirtpeddrawablevariation)
		local ismale = IsPedModel(ped,"mp_m_freemode_01")
		local isfemale = IsPedModel(ped,"mp_f_freemode_01")
		if Config.GearLights == true and DoesEntityExist(ped) and not IsEntityDead(ped) then
			if wearinggearlight == 1 and IsControlJustPressed(0, Config.gearlightkey) and gearlight == 0 then
				SetEnableScubaGearLight(ped, true)
				gearlight = 1
			elseif wearinggearlight == 1 and IsControlJustPressed(0, Config.gearlightkey) and gearlight == 1 then
				SetEnableScubaGearLight(ped, false)
				gearlight = 0
			elseif wearinggearlight == 0 then
				Wait(100)
			end
		else
			Wait(100)
		end
	end
end)
