Scriptname C00MoveKodlakAndVilkasScript extends ObjectReference  

ReferenceAlias Property Kodlak  Auto  
ReferenceAlias Property Vilkas  Auto
ObjectReference Property KodlakSpot auto
ObjectReference Property VilkasSpot auto
ObjectReference Property TargetArea auto

Quest Property C00 auto
Quest Property FightQuest auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
	if     (C00.GetStage() <= 10)
		(FightQuest as C00JorrvaskrFightSceneScript).FightOngoing = False
		FightQuest.Stop()
        if (Kodlak.GetReference().GetDistance(TargetArea) > 300.0)
		  Kodlak.GetReference().MoveTo(KodlakSpot)
        endif
        if (Vilkas.GetReference().GetDistance(TargetArea) > 300.0)
		  Vilkas.GetReference().MoveTo(VilkasSpot)
        endif

		Delete()
	endif
EndEvent
