Scriptname MG02DraugrTolfdirFGScript extends ObjectReference  


Quest Property MG02  Auto  

ReferenceAlias Property MG02TolfdirAlias  Auto  

int DoOnce

;increment quest script var every time one of these guys dies; when all 4 are dead have Tolfdir EVP

Event OnDeath (Actor AkKiller)

MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if DoOnce == 0
		QuestScript.MG02DraugrTolfdirCount += 1
		If QuestScript.MG02DraugrTolfdirCount == 4
			MG02TolfdirAlias.GetActorReference().EvaluatePackage()
		endif
		DoOnce =1
	endif

EndEvent