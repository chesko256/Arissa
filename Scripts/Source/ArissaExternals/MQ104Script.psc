Scriptname MQ104Script extends Quest  Conditional

import Game

;Event OnUpdate()
; ; ;	debug.traceconditional(self + " MQ104 OnUpdate", MQDebug.value)
;
;	; wait for dragon death sequence to finish
;	if GetStageDone(85) == 1 && GetStageDone(90) == 0
;		if Alias_Dragon.GetActorRef().IsInFaction(MQKillDragonFaction)
;			setstage(90)
;		else
;			; single updates to avoid updates stacking up
;			RegisterForSingleUpdate(1)
;		endif
;	endif
;endEvent

int Property dragonSceneLoop = 0 Auto  Conditional
{used to conditionalize looping dialogue in MQ104DragonDeathScene
}

float Property greybeardSummonsTimer  Auto  
{summon from Greybeards if you take too long returning to Solitude}

ReferenceAlias Property FactionLeaderAlias  Auto 
{Tullius or Ulfric} 

Location Property HighHrothgarLocation  Auto  

Location Property FortLocation  Auto  
{Fort Hraggstad or Fort Amol}

Location Property HQLocation  Auto  
{Solitude or Windhelm}

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property MQDebug  Auto  

Faction Property MQKillDragonFaction  Auto  

ReferenceAlias Property Alias_Dragon  Auto  
