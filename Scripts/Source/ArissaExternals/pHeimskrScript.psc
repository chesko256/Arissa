Scriptname pHeimskrScript extends ObjectReference Conditional

Scene Property pHeimskrScene  Auto  
ObjectReference Property pHeimskrMarker  Auto
int Property pHeimskrPreach  Auto  Conditional   


Event OnLoad()
	RegisterForUpdate(5)
EndEvent

Event OnUnload()
	UnregisterForUpdate()
endEvent

Event OnUpdate()

;This controls Heimskr doing his crazy Talos speeches
 
if pHeimskrPreach == 0
	if GetDistance(pHeimskrMarker) <= 300
		if Game.GetPlayer().GetDistance(Self) <= 800 
			pHeimskrScene.Start() 
			pHeimskrPreach = 1
		endif
	endif
endif

EndEvent
