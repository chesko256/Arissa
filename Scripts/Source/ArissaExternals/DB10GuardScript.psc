Scriptname DB10GuardScript extends Actor Conditional 

Quest Property pDB10  Auto  

Event OnDeath(Actor aThisGuyKilledMe)

pDB10Script pScript = pDB10 as pDB10Script

if pDB10.GetStage () == 30
	pDB10.SetStage(35)
	;pScript.pPenitusKilled +1
endif	

EndEvent



;----------------------------------
;Old Stuff

;if pScript.pGuardsKilled < 2
	;pScript.IncrementGuardDeathCounter()
	;pScript.pGuardsKilled +1
;endif

;if pScript.pGuardsKilled == 2
	;pScript.IncrementGuardDeathCounter()
	;pDB10.SetStage(35)
;endif
