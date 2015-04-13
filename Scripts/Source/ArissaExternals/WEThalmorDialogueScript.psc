Scriptname WEThalmorDialogueScript extends Quest  

Faction Property WEThalmorDialogueSuspiciousFaction  Auto  

GlobalVariable Property WEThalmorAskAboutTalos  Auto  

Faction Property WEThalmorPlayerEnemyFaction  Auto  

function makeSuspicious(actor ActorToMakeSuspicious)
	ActorToMakeSuspicious.AddToFaction(WEThalmorDialogueSuspiciousFaction)

EndFunction

function playerLearnedTalosIsIllegal()
	WEThalmorAskAboutTalos.setValue(1)
endfunction

function makeEnemyOfPlayer(Actor ActorToMakeEnemy)
	ActorToMakeEnemy.AddToFaction(WEThalmorPlayerEnemyFaction)
	
EndFunction
