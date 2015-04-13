Scriptname CWPrepareCityScript extends Quest  

Faction Property CWCivilianFaction  Auto  

ReferenceAlias Property MainGate  Auto  

ReferenceAlias Property GuardStart  Auto  

Weather Property CWSiegeWeatherFogClose Auto

ReferenceAlias Property GuardExterior1A Auto
ReferenceAlias Property GuardExterior2B Auto
ReferenceAlias Property GuardExterior3C Auto
ReferenceAlias Property GuardExterior4A Auto
ReferenceAlias Property GuardExterior5B Auto
ReferenceAlias Property GuardExterior6C Auto
ReferenceAlias Property GuardExterior7A Auto
ReferenceAlias Property GuardExterior8B Auto
ReferenceAlias Property GuardExterior9C Auto
ReferenceAlias Property GuardExterior10A Auto
ReferenceAlias Property GuardExterior11B Auto
ReferenceAlias Property GuardExterior12C Auto
ReferenceAlias Property GuardExterior13A Auto
ReferenceAlias Property GuardExterior14B Auto
ReferenceAlias Property GuardExterior15C Auto
ReferenceAlias Property GuardExterior16A Auto
ReferenceAlias Property GuardExterior17B Auto
ReferenceAlias Property GuardExterior18C Auto
ReferenceAlias Property GuardExterior19A Auto
ReferenceAlias Property GuardExterior20B Auto
ReferenceAlias Property GuardExterior21C Auto
ReferenceAlias Property GuardExterior22A Auto
ReferenceAlias Property GuardExterior23B Auto
ReferenceAlias Property GuardExterior24C Auto
ReferenceAlias Property GuardExterior25A Auto
ReferenceAlias Property GuardExterior26B Auto
ReferenceAlias Property GuardExterior27C Auto
ReferenceAlias Property GuardExterior28A Auto
ReferenceAlias Property GuardExterior29B Auto
ReferenceAlias Property GuardExterior30C Auto


ReferenceAlias Property GuardInterior1 Auto
ReferenceAlias Property GuardInterior2 Auto
ReferenceAlias Property GuardInterior3 Auto
ReferenceAlias Property GuardInterior4 Auto
ReferenceAlias Property GuardInterior5 Auto
ReferenceAlias Property GuardInterior6 Auto
ReferenceAlias Property GuardInterior7 Auto
ReferenceAlias Property GuardInterior8 Auto
ReferenceAlias Property GuardInterior9 Auto
ReferenceAlias Property GuardInterior10 Auto
ReferenceAlias Property GuardInterior11 Auto
ReferenceAlias Property GuardInterior12 Auto
ReferenceAlias Property GuardInterior13 Auto
ReferenceAlias Property GuardInterior14 Auto
ReferenceAlias Property GuardInterior15 Auto
ReferenceAlias Property GuardInterior16 Auto
ReferenceAlias Property GuardInterior17 Auto
ReferenceAlias Property GuardInterior18 Auto
ReferenceAlias Property GuardInterior19 Auto
ReferenceAlias Property GuardInterior20 Auto
ReferenceAlias Property GuardInterior21 Auto
ReferenceAlias Property GuardInterior22 Auto
ReferenceAlias Property GuardInterior23 Auto
ReferenceAlias Property GuardInterior24 Auto
ReferenceAlias Property GuardInterior25 Auto
ReferenceAlias Property GuardInterior26 Auto
ReferenceAlias Property GuardInterior27 Auto
ReferenceAlias Property GuardInterior28 Auto
ReferenceAlias Property GuardInterior29 Auto
ReferenceAlias Property GuardInterior30 Auto



function ProcessGuardAliasIntoInteriorExteriorAlias(ReferenceAlias AliasToTest)
	ObjectReference RefToTest = AliasToTest.GetReference()

; 	CWScript.Log("CWPrepareCityScript", self + "ForceGuardToInteriorExteriorAlias() Processing Alias:" + AliasToTest + ", which holds RefToTest:" + RefToTest)
	
	if RefToTest.IsInInterior()
; 		CWScript.Log("CWPrepareCityScript", self + "ForceGuardToInteriorExteriorAlias() RefToTest IsInInterior == true, calling ForceIntoNextInteriorAlias()")
		ForceIntoNextInteriorAlias(RefToTest)
	Else
; 		CWScript.Log("CWPrepareCityScript", self + "ForceGuardToInteriorExteriorAlias() RefToTest IsInInterior == false, calling ForceIntoNextExteriorAlias()")
		ForceIntoNextExteriorAlias(RefToTest)
	EndIf

EndFunction


function ForceIntoNextExteriorAlias(ObjectReference RefToForce)

	if TryToForceRef(GuardExterior1A, RefToForce)
	elseif	TryToForceRef(GuardExterior2B, RefToForce)
	elseif TryToForceRef(GuardExterior3C, RefToForce)
	elseif TryToForceRef(GuardExterior4A, RefToForce)
	elseif TryToForceRef(GuardExterior5B, RefToForce)
	elseif TryToForceRef(GuardExterior6C, RefToForce)
	elseif TryToForceRef(GuardExterior7A, RefToForce)
	elseif TryToForceRef(GuardExterior8B, RefToForce)
	elseif TryToForceRef(GuardExterior9C, RefToForce)
	elseif TryToForceRef(GuardExterior10A, RefToForce)
	elseif TryToForceRef(GuardExterior11B, RefToForce)
	elseif TryToForceRef(GuardExterior12C, RefToForce)
	elseif TryToForceRef(GuardExterior13A, RefToForce)
	elseif TryToForceRef(GuardExterior14B, RefToForce)
	elseif TryToForceRef(GuardExterior15C, RefToForce)
	elseif TryToForceRef(GuardExterior16A, RefToForce)
	elseif TryToForceRef(GuardExterior17B, RefToForce)
	elseif TryToForceRef(GuardExterior18C, RefToForce)
	elseif TryToForceRef(GuardExterior19A, RefToForce)
	elseif TryToForceRef(GuardExterior20B, RefToForce)
	elseif TryToForceRef(GuardExterior21C, RefToForce)
	elseif TryToForceRef(GuardExterior22A, RefToForce)
	elseif TryToForceRef(GuardExterior23B, RefToForce)
	elseif TryToForceRef(GuardExterior24C, RefToForce)
	elseif TryToForceRef(GuardExterior25A, RefToForce)
	elseif TryToForceRef(GuardExterior26B, RefToForce)
	elseif TryToForceRef(GuardExterior27C, RefToForce)
	elseif TryToForceRef(GuardExterior28A, RefToForce)
	elseif TryToForceRef(GuardExterior29B, RefToForce)
	elseif TryToForceRef(GuardExterior30C, RefToForce)
		
	Else
; 		CWScript.Log("CWPrepareCityScript", self + " WARNING: ForceIntoNextExteriorAlias() ran out of Exterior Aliases to force into ", 2, 1 ,1)
	EndIf

EndFunction

function ForceIntoNextInteriorAlias(ObjectReference RefToForce)

	if TryToForceRef(GuardInterior1, RefToForce)
	elseif TryToForceRef(GuardInterior2, RefToForce)
	elseif TryToForceRef(GuardInterior3, RefToForce)
	elseif TryToForceRef(GuardInterior4, RefToForce)
	elseif TryToForceRef(GuardInterior5, RefToForce)
	elseif TryToForceRef(GuardInterior6, RefToForce)
	elseif TryToForceRef(GuardInterior7, RefToForce)
	elseif TryToForceRef(GuardInterior8, RefToForce)
	elseif TryToForceRef(GuardInterior9, RefToForce)
	elseif TryToForceRef(GuardInterior10, RefToForce)
	elseif TryToForceRef(GuardInterior11, RefToForce)
	elseif TryToForceRef(GuardInterior12, RefToForce)
	elseif TryToForceRef(GuardInterior13, RefToForce)
	elseif TryToForceRef(GuardInterior14, RefToForce)
	elseif TryToForceRef(GuardInterior15, RefToForce)
	elseif TryToForceRef(GuardInterior16, RefToForce)
	elseif TryToForceRef(GuardInterior17, RefToForce)
	elseif TryToForceRef(GuardInterior18, RefToForce)
	elseif TryToForceRef(GuardInterior19, RefToForce)
	elseif TryToForceRef(GuardInterior20, RefToForce)
	elseif TryToForceRef(GuardInterior21, RefToForce)
	elseif TryToForceRef(GuardInterior22, RefToForce)
	elseif TryToForceRef(GuardInterior23, RefToForce)
	elseif TryToForceRef(GuardInterior24, RefToForce)
	elseif TryToForceRef(GuardInterior25, RefToForce)
	elseif TryToForceRef(GuardInterior26, RefToForce)
	elseif TryToForceRef(GuardInterior27, RefToForce)
	elseif TryToForceRef(GuardInterior28, RefToForce)
	elseif TryToForceRef(GuardInterior29, RefToForce)
	elseif TryToForceRef(GuardInterior30, RefToForce)
		
	Else
; 		CWScript.Log("CWPrepareCityScript", self + " WARNING: ForceIntoNextInteriorAlias() ran out of Interior Aliases to force into ", 2, 1 ,1)
	EndIf
EndFunction

bool Function TryToForceRef(ReferenceAlias AliasToTryToForceInto, ObjectReference RefToForce)
{Returns if AliasToTryToForceInto is empty and RefToForce is forced into it, otherwise returns false and nothing else happens}
	if AliasToTryToForceInto.GetReference() == False
		AliasToTryToForceInto.ForceRefTo(RefToForce)
; 		CWScript.Log("CWPrepareCityScript", self + "TryToForceRef() is forcing ref:" + RefToForce + " into alias: " + AliasToTryToForceInto)
		return True
	Else
		return False
	EndIf

EndFunction

