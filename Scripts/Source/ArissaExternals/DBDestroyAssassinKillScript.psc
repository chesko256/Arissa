Scriptname DBDestroyAssassinKillScript extends ReferenceAlias  

Quest Property DBDestroyQuest  Auto 
int Property pAssassinsKilled  Auto   

Event OnDeath(Actor aThisGuyKilledMe)

DBDestroyQuestScript pScript = DBDestroyQuest as DBDestroyQuestScript 

pScript.pAssassinsKilled += 1
 
;if pScript.pAssassinsKilled == 5 
	;DBDestroyQuest.SetStage (30)
;endif	 


EndEvent


