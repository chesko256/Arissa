scriptName dunGhoruunBossBattle extends Actor
{ Boss Battle script for the MS14 GhorrunHall battle. Placed on the Boss Vampire. }
import Debug

;VFX
;Activator property SummonFX Auto
Spell property selfInvisible Auto

;Quest
quest property myQuest auto
int property stage auto

;internal Variables
int bossHealth
int InvisibleCheck 

;Packages
package Property dunGhoruunRunPackage  Auto  

ObjectReference property player Auto

Event onLoad()
	bossHealth = Self.GetActorValue("health") as int
	InvisibleCheck = 0
endEvent

Event onHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	bossHealth = Self.GetActorValue("health") as int
	if (bossHealth  <= 50 && InvisibleCheck == 0)
		InvisibleCheck = 1
		;bossInvisible()
		bossRun()
	endif
endEvent

Function bossInvisible()
	selfInvisible.Cast(Self,Self)
	;Notification("SHAZAM!")
	;bossRun()
endFunction

Function bossRun()
	myQuest.setstage(stage)
	;Notification("Stage Set")
	bossInvisible()
endFunction 

