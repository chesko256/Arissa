;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname SF_WE01SceneA_0001DD0A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; debug.trace("WE01SceneA start")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; debug.trace("WE01SceneA end")
if BanditVictim.GetActorReference().GetCombatState() == 0  && \
	Boss.GetActorReference().GetCombatState() == 0 && \
	Bandit1.GetActorReference().GetCombatState() == 0 && \
	Bandit2.GetActorReference().GetCombatState() == 0 && \
	BanditVictim.GetActorReference().IsDead() == false && \
	Boss.GetActorReference().IsDead() == false && \
	Bandit1.GetActorReference().IsDead() == false && \
	Bandit2.GetActorReference().IsDead() == false

		start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BanditVictim  Auto  

ReferenceAlias Property Boss  Auto  

ReferenceAlias Property Bandit1  Auto  

ReferenceAlias Property Bandit2  Auto  
