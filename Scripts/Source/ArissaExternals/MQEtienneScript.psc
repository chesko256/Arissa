Scriptname MQEtienneScript extends ObjectReference  
{redress Etienne when back in Riften}

auto  state waiting
Event OnLoad()
	; put normal outfit on
	if MQ201.GetStage() >= 230
		; if he's in Riften
		if GetEditorLocation() == GetCurrentLocation()
			gotoState("done")
			ObjectReference selfRef = self as ObjectReference
			(selfRef as Actor).SetOutfit(ThievesGuildStandardOutfit)
			if GetItemCount(steelSword) == 0
				Additem(SteelSword)
			endif
		endif
	endif
endEvent
endState

state done
; done
endState

Quest Property MQ201  Auto  

Outfit Property ThievesGuildStandardOutfit  Auto  


WEAPON Property SteelSword  Auto  
