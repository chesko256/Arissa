Scriptname DA16SkullPedestalScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  Conditional
;ObjectReference Property pDA16PedestalBefore Auto
;ObjectReference Property pDA16PedestalAfter Auto
ObjectReference Property pDA16Skull Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDA16Quest.GetStage() == 199
			;pDA16PedestalBefore.Disable()
			;pDA16PedestalAfter.Enable()
			self.damageObject(5)
			Game.GetPlayer().AddItem(pDA16Skull,1)
			pDA16Quest.SetStage(200)
		endif
	endif


endEvent