Scriptname MS11SecondMurderActivator extends ObjectReference  

Quest Property ShadowQuest Auto
Scene Property KickoffScene Auto

Event OnActivate(ObjectReference activator)
	ShadowQuest.Start()
	ShadowQuest.SetStage(10)
	KickoffScene.Start()
	Disable()
endEvent