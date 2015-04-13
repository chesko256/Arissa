Scriptname MG01AtronachTriggerScript extends ObjectReference  

Quest Property MG01  Auto  

ActorBase Property FlameAtronach  Auto  

ReferenceAlias Property MG01Nirya Auto

Event OnTriggerEnter(ObjectReference AkActor)

	MG01QuestScript MG01Script = MG01 as MG01QuestScript

; If we're looking for a shout, make sure the player is in this volume and therefore close by enough

	if AkActor == Game.GetPlayer()
		MG01Script.ShoutTrigger=1
	endif



; If we're looking for Atronach demonstration, update script var and EVP actor when one enters the volume

	if MG01.GetStage() == 21

; ;	Debug.Trace(AkActor.GetBaseObject() + " entered trigger")

		if MG01Script.NiryaSpellSuccess == 0
			if AkActor.GetBaseObject() == FlameAtronach || AkActor.GetBaseObject() == PotentFlameAtronach || AkActor.GetBaseObject() == FlameThrall
				MG01Script.NiryaSpellSuccess=1
				MG01Nirya.GetActorReference().EvaluatePackage()
			endif
		endif
	endif

	
EndEvent

Event OnTriggerLeave(ObjectReference AkActor)

MG01Questscript MG01Script = MG01 as MG01QuestScript

	if AkActor == Game.GetPlayer()
		if MG01Script.ShoutTrigger ==1
			MG01Script.ShoutTrigger=0
		endif
	endif

EndEvent


actorbase Property FlameThrall  Auto  

actorbase Property PotentFlameAtronach  Auto  
