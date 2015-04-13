Scriptname T02RukiTriggerScript extends ObjectReference

Quest Property T02 Auto
ReferenceAlias Property Fenrig Auto
Scene Property LoversScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		if (T02.GetStage() == 95)
			Fenrig.GetActorReference().MoveTo(Game.GetPlayer())
			Fenrig.GetActorReference().Enable(true)
			LoversScene.Start()
			Delete()
		endif
	endif
endEvent

