;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_dunLabyrinthian_00091F1A Extends Quest Hidden

;BEGIN ALIAS PROPERTY skeletalDragon
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_skeletalDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Morokei
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Morokei Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thrall02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Thrall02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MagicBarrier
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MagicBarrier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thrall01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Thrall01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Set when the Dragon Priest Morokei is freed
Alias_MagicBarrier.getReference().playAnimation(barrierDownAnim)
Alias_MagicBarrier.getReference().disable()
Alias_Morokei.getActorReference().setGhost(FALSE)
Alias_Morokei.getActorReference().setActorValue("aggression",2)
Alias_Morokei.getActorReference().removeSpell(ghostAbility)
Alias_Morokei.getActorReference().setNoFavorAllowed(FALSE)
Alias_Morokei.getActorReference().setAlpha(1.0)
Alias_Morokei.getActorReference().startCombat(game.getPlayer())
Alias_Morokei.getActorReference().equipItem(MG07StaffofMagnus, TRUE, TRUE)
utility.wait(5.0)
Alias_MagicBarrier.getReference().delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; This stage is set when the player enters the hall of Stories before the boss Chamber
; various handling bits for Morokei
Alias_Morokei.getActorReference().setGhost(TRUE)
Alias_Morokei.getActorReference().addSpell(ghostAbility)
Alias_Morokei.getActorReference().setNoFavorAllowed(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; prep stage - skeletons charge in before dragon reanimates.
int t = skeletonChargers.getSize()
int i = 0
while i < t
	form Skelly = skeletonChargers.getAt(i)
	(Skelly as actor).evaluatePackage()
	(Skelly as actor).startCombat(game.getPlayer())
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; stage to set when player enters dragon chamber
alias_SkeletalDragon.getActorReference().startCombat(game.getPlayer())
;skeletalDragon.setAV("aggression", 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; stage set when Thrall01 gets interrupted
if getStageDone(92) == TRUE
setStage(95)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; stage set when Thrall01 gets interrupted
if getStageDone(91) == TRUE
setStage(95)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

formlist Property SkeletonChargers  Auto  
{EVP through this list.}

string Property BarrierDownAnim  Auto  

Weapon Property MG07StaffOfMagnus  Auto  

Spell Property ghostAbility  Auto  
