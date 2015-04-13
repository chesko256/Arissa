Scriptname DA09TempleExteriorTriggerScript extends ReferenceAlias  

Scene Property DA09ExteriorTempleScene Auto
ReferenceAlias Property xMarkerVoice Auto
ReferenceAlias Property Gem Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	ObjectReference playerRef = Game.GetPlayer()
	
	if akActionRef == playerRef && PlayerRef.GetItemCount(Gem.GetReference().GetBaseObject()) > 0
		xMarkerVoice.GetReference().MoveTo(Game.GetPlayer())
		DA09ExteriorTempleScene.Start()
		
		GetReference().Disable()
	EndIf

EndEvent
