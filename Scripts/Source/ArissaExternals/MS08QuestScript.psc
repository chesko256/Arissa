Scriptname MS08QuestScript extends Quest  Conditional

int Property SaadiaFollow  Auto  Conditional
int Property DungeonFound  Auto  Conditional
int Property SaadiaConfide  Auto  Conditional
int Property InitialForcegreet  Auto  Conditional
int Property SaadiaCaptured  Auto  Conditional

int Property CleanUpCheckVar  Auto  Conditional


FUNCTION CleanupCheck()


;	CleanUpCheckVar = CleanUpCheckVar + 1
;	if CleanUpCheckVar == 2
		SetStage(255)
;	endif


EndFunction

Event OnUpdate()

	if GetStage() >= 100
		if MS08AlikrPrisoner.GetReference().IsNearPlayer() == False
			if MS08AlikrPrisoner.GetReference().GetDistance(Game.GetPlayer()) > 2000
				MS08AlikrPrisoner.GetReference().Disable()
				UnregisterforUpdate()
			endif
		endif
	endif

EndEvent


GlobalVariable Property FavorRewardLarge  Auto  

int Property FineVar = 0 Auto  Conditional

int Property SaadiaAmbushFG  Auto  Conditional
int Property KematuAngry  Auto  Conditional
Cell Property WhiterunDragonsreachBasement  Auto  

ReferenceAlias Property MS08AlikrPrisoner  Auto  
