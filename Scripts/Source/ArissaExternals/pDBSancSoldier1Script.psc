Scriptname pDBSancSoldier1Script extends Actor Conditional 

Quest Property pDB10  Auto  
int Property pSoldier1Die  Auto  Conditional

Event OnDeath(Actor aThisGuyKilledMe)

	;pDB10Script questWhoCares = pDB10 as pDB10Script
	;questWhoCares.IncrementGuardDeathCounter()

EndEvent
