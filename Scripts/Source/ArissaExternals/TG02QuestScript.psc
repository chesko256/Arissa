scriptName TG02QuestScript extends Quest  Conditional

int property pTG02SceneStart Auto Conditional
int property pTG02BrynjolfMove Auto Conditional											;1= Triggers Brynjolf's Escort (Temp Travel for now)
int property pTG02BrynjolfReaction Auto Conditional										;x= A variable to measure Brynjolf's post-discussion reaction
int property pTG02HiveDestroy Auto Conditional											;x= The number of bee hives destroyed
int property pTG02JobDone Auto	 Conditional												;2= Player completed both tasks
int property pTG02SafeCracked Auto Conditional											;1= Player got the safe loot
int property pTG02MavenDialogue Auto Conditional
int property pTG02QuestFailure Auto Conditional
int property pTG02Forcegreet Auto Conditional
int property pTG02IntroDone Auto Conditional
int property pTG02Dia Auto Conditional
int property pTG02Dia01 Auto Conditional
int property pTG02Dia02 Auto Conditional
int property pTG02HouseTriggerDone Auto Conditional
int property pTG02TunnelTriggerDone Auto Conditional
int Property pTG02AringothDone Auto Conditional
int Property pTG02BrynPathDone Auto Conditional
int Property pTG02PlayerPathDone Auto Conditional
GlobalVariable Property pTG02Failure Auto Conditional
GlobalVariable Property pTG02HiveCount  Auto  Conditional 
Quest Property pTG03Quest  Auto Conditional
Quest Property pTG02BQuest Auto Conditional
Alias Property pTG02SafeContentsAlias  Auto Conditional
ReferenceAlias Property pTG02BillofSale Auto Conditional
Scene Property pTG02IntroScene  Auto  Conditional
Scene Property pTG02IntroScene02  Auto  Conditional
ObjectReference Property pTG02GuildDoor  Auto  Conditional
Faction Property pTG02TGFaction Auto Conditional
ObjectReference Property pTG02HiveMercs Auto Conditional
GlobalVariable Property pRiften  Auto
LeveledItem Property pReward Auto

event OnUpdate()

	if ( pTG02JobDone >= 2 )
		SetStage (50)
		pTG02JobDone = -1
	else
		RegisterForSingleUpdate(1)
	endif

endEvent

function HiveGone()										;When a bee hive is destoyed, do a bunch of housekeeping

	pTG02HiveDestroy += 1		;This is the general count overall

	if pTG02HiveDestroy == 1	;Once 1 bee hive is destroyed, send out reinforcement Mercs to investigate
		pTG02HiveMercs.enable()
	endif
	if pTG02HiveDestroy < 4
		ModObjectiveGlobal(1, pTG02HiveCount, 40)		;This is the global variable count for the objective - stop count at 3/3 for now
	endif	

	if pTG02HiveDestroy == 3							;This completes the part of the quest when 3 are destroyed
		pTG02JobDone += 1
		SetObjectiveCompleted (40, 1)
	endif

	if pTG02HiveDestroy >= 4							;This fails the quest when more than 3 are destroyed
		pTG02QuestFailure = 1
	endif

endFunction

function RemoveBillofSale()

	Game.GetPlayer().RemoveItem(pTG02BillOfSale.GetReference())

endFunction

function Rewarded()

	Game.GetPlayer().AddItem(pReward)

endFunction

function ScenePlay()
	
	if GetStageDone(15) == 0
		if pTG02BrynPathDone == 1 && pTG02PlayerPathDone == 1
			SetStage(15)
		endif
	endif

endFunction
