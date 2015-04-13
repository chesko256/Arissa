Scriptname Favor057GuardScript extends ReferenceAlias  

int startinghealth
int playerhealth
int init

Event OnUpdate()

	actor pActor = GetActorRef()
	if pActor.IsInCombat() == 0
		if pActor.IsBleedingOut() == 0
	
			GetOwningQuest().SetStage(20)
		endif
	endif

	if init == 0
		startinghealth = Game.GetPlayer().GetAv("Health") as int
		init = 1
	endif

 	playerhealth = Game.GetPlayer().GetAv("Health") as int
	if playerhealth < startinghealth/2
		GetOwningQuest().SetStage(18)
	endif


EndEvent