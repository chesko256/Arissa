Scriptname DB05GuestScript extends ReferenceAlias  

Event OnDeath(Actor aThisGuyKilledMe)

If pDB05.GetStage () >= 10
	If pDB05.GetStage () < 200
		DB05Script pScript = GetOwningQuest() as DB05Script
		pScript.WeddingKilled = 1
	endif
endif

EndEvent


Quest Property pDB05  Auto  
