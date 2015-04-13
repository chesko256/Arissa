Scriptname CraftSmithing extends ObjectReference  

; Maps a material keyword to the minimum skill required to smith an
; object with that material
int Function GetMinSkill(Keyword ItemMaterial)
	if(ItemMaterial == WeaponMaterialSteel)
		return 5
	elseif(ItemMaterial == WeaponMaterialOrchish)
		return 15
	elseif(ItemMaterial == WeaponMaterialDwarven)
		return 30
	elseif(ItemMaterial == WeaponMaterialElven)
		return 45
	elseif(ItemMaterial == WeaponMaterialGlass)
		return 60
	elseif(ItemMaterial == WeaponMaterialEbony)
		return 75
	elseif(ItemMaterial == WeaponMaterialDaedric)
		return 90
	elseif(ItemMaterial == ArmorMaterialIron || ItemMaterial == ArmorMaterialHide) 
		return 10
	elseif(ItemMaterial == ArmorMaterialIronBanded || ItemMaterial == ArmorMaterialStudded || ItemMaterial == ArmorMaterialImperial) 
		return 20
	elseif(ItemMaterial == ArmorMaterialSteel || ItemMaterial == ArmorMaterialFullLeather || ItemMaterial == ArmorMaterialImperialReinforced)
		return 30
	elseif(ItemMaterial == ArmorMaterialDwarven || ItemMaterial == ArmorMaterialElven || ItemMaterial == ArmorMaterialImperialHeavy)
		return 40
	elseif(ItemMaterial == ArmorMaterialSteelPlate || ItemMaterial == ArmorMaterialScaled)
		return 50
	elseif(ItemMaterial == ArmorMaterialOrcish || ItemMaterial == ArmorMaterialElvenSplinted)
		return 60
	elseif(ItemMaterial == ArmorMaterialEbony || ItemMaterial == ArmorMaterialGlass)
		return 70
	elseif(ItemMaterial == ArmorMaterialDragonPlate || ItemMaterial == ArmorMaterialDragonScale)
		return 80
	elseif(ItemMaterial == ArmorMaterialDaedric || ItemMaterial == ArmorMaterialStormcloak)
		return 90
	else
		return 0
	endif
EndFunction

; Called from native code. This function must be present to allow a furniture to smith items.
; Only change the function name, parameters, or return type if the call from native code is updated also.
float Function CalculateSmithingValue(Keyword ItemMaterial, int iSmithingSkill)
	float fsmithingValue = 1.0

	if(ItemMaterial != None)
		int iminSkill = GetMinSkill(ItemMaterial);
		if(iSmithingSkill >= iminSkill)
			fsmithingValue = 1.0 + (iSmithingSkill - iMinSkill) / 100.0
		endif
	endif
	
	return fsmithingValue
EndFunction


; Various materials items can be made of.
; The easiest way to get these bound is to duplicate a furniture
; that already has them set.
keyword Property WeaponMaterialIron Auto 
keyword Property WeaponMaterialSteel Auto 
keyword Property WeaponMaterialOrchish Auto 
keyword Property WeaponMaterialDwarven Auto 
keyword Property WeaponMaterialElven Auto 
keyword Property WeaponMaterialGlass Auto 
keyword Property WeaponMaterialEbony Auto 
keyword Property WeaponMaterialDaedric Auto 

keyword Property ArmorMaterialIron Auto
keyword Property ArmorMaterialHide Auto
keyword Property ArmorMaterialIronBanded Auto
keyword Property ArmorMaterialStudded Auto
keyword Property ArmorMaterialImperial Auto
keyword Property ArmorMaterialImperialReinforced Auto
keyword Property ArmorMaterialImperialHeavy Auto
keyword Property ArmorMaterialSteel Auto
keyword Property ArmorMaterialFullLeather Auto
keyword Property ArmorMaterialDwarven Auto
keyword Property ArmorMaterialElven Auto
keyword Property ArmorMaterialSteelPlate Auto
keyword Property ArmorMaterialScaled Auto
keyword Property ArmorMaterialOrcish Auto
keyword Property ArmorMaterialElvenSplinted Auto
keyword Property ArmorMaterialEbony Auto
keyword Property ArmorMaterialGlass Auto
keyword Property ArmorMaterialDragonplate Auto
keyword Property ArmorMaterialDragonscale Auto
keyword Property ArmorMaterialDaedric Auto
keyword Property ArmorMaterialStormcloak Auto