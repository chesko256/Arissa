Scriptname MS11InvestigateTriggerScript extends ReferenceAlias  


Message Property Info auto
ReferenceAlias Property ActualObject auto
ReferenceAlias Property ActualObject2 auto
ReferenceAlias Property ActualObject3 auto
ReferenceAlias Property ActualObject4 auto
ReferenceAlias Property ActualObject5 auto
ReferenceAlias Property ActualObject6 auto
ReferenceAlias Property ActualObject7 auto
ReferenceAlias Property ActualObject8 auto
ReferenceAlias Property ActualObject9 auto
ReferenceAlias Property ActualObject10 auto
ReferenceAlias Property ActualObject11 auto
ReferenceAlias Property ActualObject12 auto


Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Info.Show()
		Cleanup()
	endif
EndEvent


Function Cleanup()
	if (ActualObject)
		ActualObject.TryToClear()
	endif
	if (ActualObject2)
		ActualObject2.TryToClear()
	endif
	if (ActualObject3)
		ActualObject3.TryToClear()
	endif
	if (ActualObject4)
		ActualObject4.TryToClear()
	endif
	if (ActualObject5)
		ActualObject5.TryToClear()
	endif
	if (ActualObject6)
		ActualObject6.TryToClear()
	endif
	if (ActualObject7)
		ActualObject7.TryToClear()
	endif
	if (ActualObject8)
		ActualObject8.TryToClear()
	endif
	if (ActualObject9)
		ActualObject9.TryToClear()
	endif
	if (ActualObject10)
		ActualObject10.TryToClear()
	endif
	if (ActualObject11)
		ActualObject11.TryToClear()
	endif
	if (ActualObject12)
		ActualObject12.TryToClear()
	endif

	ObjectReference me = GetReference()
	Clear()
	me.Disable()
	me.Delete()
EndFunction
