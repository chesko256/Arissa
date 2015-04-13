Scriptname defaultMoveActorTriggerScript extends ObjectReference  
{move any ACTOR that hits the trigger somewhere}

ObjectReference Property MoveToMarker  Auto  
{where to move the actors}

ObjectReference Property IgnoreMe1  Auto  
{don't move this ref if it hits the trigger.}

auto state waiting
EVENT onTriggerEnter(objectReference triggerRef)
; 	debug.trace(self + " onTriggerEnter " + triggerRef)
	; NOTE: ONLY MOVE ACTORS
	Actor triggerActor = triggerRef as Actor
	if (triggerActor && triggerActor != IgnoreMe1)
		; move the actor
		triggerActor.MoveTo(MoveToMarker)
		if bDispelAllSpells
			triggerActor.DispelAllSpells()
		endif
		; is this the setstage actor?
		if triggerActor == SetStageActor
			if SetStageQuest && StageToSet > -1
				SetStageQuest.SetStage(StageToSet)
			endif
		endif
	endif
endEVENT
endState

Bool Property bDispelAllSpells = TRUE Auto  
{ dispell all spells on actor when moving? }

Actor Property SetStageActor  Auto  

Quest Property SetStageQuest  Auto  

Int Property StageToSet = -1  Auto  
