Scriptname DA02BoethiahsConduitScript extends ReferenceAlias  

ObjectReference selfRef

ImageSpaceModifier Property DA02IMODConduitA auto
ImageSpaceModifier Property DA02IMODConduitB auto


EffectShader Property DA02BoethiahFXS Auto

int Distance = 500


float CrossFadeTime = 4.0

float UpdateTime = 5.0

int nextIMOD = 0

bool FXSRemovedBecauseOfDistance

Event OnUpdate()
	SelfRef = GetReference()
	ObjectReference PlayerRef = Game.GetPlayer()
	
	if SelfRef.GetDistance(PlayerRef) > Distance
		ImageSpaceModifier.RemoveCrossFade()
		FXSRemovedBecauseOfDistance = true	
		
	Else
		getNextIMOD().ApplyCrossFade(CrossFadeTime)
		
		if FXSRemovedBecauseOfDistance
			DA02BoethiahFXS.Play(GetReference()) ;shader effect on actor
		endif
		
	EndIf

	
	
EndEvent

ImageSpaceModifier function getNextIMOD()

	if nextIMOD == 0
		nextIMOD = 1
		Return DA02IMODConduitA
	elseif nextIMOD == 1
		nextIMOD = 0
		return DA02IMODConduitB
	EndIf

EndFunction



function StartIMODs()
	nextIMOD = 0
	FXSRemovedBecauseOfDistance = false
	getNextIMOD().ApplyCrossFade(CrossFadeTime)
	DA02BoethiahFXS.Play(GetReference()) ;shader effect on actor
	RegisterForUpdate(UpdateTime)

EndFunction


function StopIMODs(bool CompletelyStop = true)  ;parameter left in for backwards compatibility with previous version of script
	DA02BoethiahFXS.Stop(GetReference())
	ImageSpaceModifier.RemoveCrossFade()
	UnregisterForUpdate()

EndFunction



;Event OnUpdate()
;	ObjectReference PlayerRef = Game.GetPlayer()
;	
;	SelfRef = GetReference()
;	
;	if playingIMODs 
;		if  SelfRef.GetDistance(PlayerRef) > Distance
;			StopIMODs()
;		EndIf
;	
;	elseif playingIMODs == False
;		if  SelfRef.GetDistance(PlayerRef) <= Distance
;			StartIMODs()
;		EndIf 
;	
;	EndIf
;
;EndEvent
;
;
;function StartIMODs(bool ShouldApplyCrossFade = true)
;
;	if shouldStartIMODs == False
;		RegisterForUpdate(UpdateTime)
;		DA02BoethiahFXS.Play(GetReference())
;		ShouldStartIMODs = True
;		
;	EndIf
;
;	if ShouldApplyCrossFade
;		DA02IMODConduitPulse01.ApplyCrossFade(CrossFadeTime)
;		playingIMODs = true
;		
;	Else
;		DA02IMODConduitPulse01.Apply()
;		playingIMODs = true
;	
;	EndIf
;
;	utility.wait(LoopTime)
;
;	if ShouldStartIMODs
;		StartIMODs(ShouldApplyCrossFade = True)
;	EndIf
;
;EndFunction
;
;Function StopIMODs(bool CompletelyStop = False)
;	ShouldStartIMODs = False
;	DA02IMODConduitFadeOut01.ApplyCrossFade(CrossFadeTime)
;	Utility.wait(CrossFadeTime)
;	playingIMODs = False
;	DA02BoethiahFXS.Stop(GetReference())
;	
;	if CompletelyStop
;		UnregisterForUpdate()
;	EndIf
;	
;EndFunction




