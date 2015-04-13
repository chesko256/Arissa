Scriptname T02QuestScript extends Quest Conditional

bool Property DinyaReadyToOffer Auto Conditional
bool Property GotPitchFromJofthor Auto Conditional
bool Property GotPitchFromBoti Auto Conditional
bool Property PersuadedBassianus Auto Conditional
bool Property PersuadedKlimmek Auto Conditional
bool Property YngvarOfferedPoem Auto Conditional
bool Property FastredMoveToRiften Auto Conditional
bool Property BassianusMoveToRiften Auto Conditional

bool Property TalkingToFastredsParents auto Conditional
bool Property TalkingToFastredsBoys auto Conditional

bool Property TalkedToFaleen auto Conditional
bool Property PlayerToldYngvarAboutCalcelmo auto Conditional

bool Property SeekingRuki auto Conditional
bool Property SeekingFenrig auto Conditional


ReferenceAlias Property Boti Auto
ReferenceAlias Property Jofthor Auto
ReferenceAlias Property Fenrig Auto
ReferenceAlias Property Ruki Auto

int Property YngvarPoemCostAmount Auto  
MiscObject Property YngvarPoemCostItem Auto  
ReferenceAlias Property LoveLetter  Auto  
ReferenceAlias Property LovePoem  Auto  

Message Property RukiMessage Auto
Message Property AscensionMessage Auto

bool Property CheckForFastredScene auto
bool Property CheckForCalcelmoScene auto
bool Property CheckForDeadLoversScene auto

Scene Property FastredScene auto
Scene Property FastredScene2 auto
Scene Property CalcelmoScene auto
Scene Property DeadLoversScene auto

Location Property Ivarstead auto
Location Property Markarth auto

Event OnUpdate()
	UnregisterForUpdate()
	return
	
	if (CheckForFastredScene)
		if ((GetStage() < 30) && (Game.GetPlayer().GetCurrentLocation() != Ivarstead))
			if (FastredScene.IsPlaying())
				FastredScene.Stop()
			endif
			if (FastredScene2.IsPlaying())
				FastredScene2.Stop()
			endif
			SetStage(30)
			CheckForFastredScene = False
			UnregisterForUpdate()
		endif
	endif
	if (CheckForCalcelmoScene)
		if ((GetStage() < 70) && (Game.GetPlayer().GetCurrentLocation() != Markarth))
			if (CalcelmoScene.IsPlaying())
				CalcelmoScene.Stop()
			endif
			SetStage(70)
			CheckForCalcelmoScene = False
			UnregisterForUpdate()
		endif
	endif
	if (CheckForDeadLoversScene)
		if (GetStage() < 100)
			if (DeadLoversScene.IsPlaying())
				DeadLoversScene.Stop()
			endif
			SetStage(100)
			CheckForDeadLoversScene = False
			UnregisterForUpdate()
		endif
	endif
EndEvent

Function GotParentPitch(ObjectReference parentInQuestion)
	if (parentInQuestion == Boti.GetReference())
		GotPitchFromBoti = true
	endif
	if (parentInQuestion == Jofthor.GetReference())
		GotPitchFromJofthor = true
	endif

	if (GotPitchFromBoti && GotPitchFromJofthor)
		SetStage(25)
	endif
endFunction


Function ListenForAnimEvents()
	while (!Fenrig.GetActorReference().Is3DLoaded())
		Utility.Wait(0.1)
	endwhile
	RegisterForAnimationEvent(Fenrig.GetActorRef(), "T02Ascend")

	while (!Ruki.GetActorReference().Is3DLoaded())
		Utility.Wait(0.1)
	endwhile
	RegisterForAnimationEvent(Ruki.GetActorRef(), "T02Ascend")
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "T02Ascend")
;     	Debug.Trace("T02: Anim event from " + akSource + "; levitating.")
    	akSource.TranslateTo(akSource.X, akSource.Y, akSource.Z + 1000, akSource.GetAngleX(), akSource.GetAngleY(), akSource.GetAngleZ(), 50)
		UnregisterForAnimationEvent(akSource, asEventName)
    endif
EndEvent

