;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname SF_dunGauldursonQST_Finale_000ECEE0 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
GetOwningQuest().SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
Game.GetPlayer().RampRumble(0.25, 1, 1600)
RumbleSFX.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SarcophagusLid.GetReference().Activate(Gauldur.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Jyrik.GetActorRef().RestoreAV("Health", 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
GauldurDelegate.Activate(Game.GetPlayer())
(PedestalManager as dunReachwaterRockPedestalManager).ReforgeAmulet()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Mikrul.GetActorRef().RestoreAV("Health", 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
dunReachwaterRockGauldurSpell.Cast(Gauldur.GetActorRef(), Gauldur.GetActorRef())
Utility.Wait(0.1)
JyrikDelegate.Activate(Gauldur.GetActorRef())
MikrulDelegate.Activate(Gauldur.GetActorRef())
SigdisDelegate.Activate(Gauldur.GetActorRef())
SarcophagusLid.GetReference().Disable(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
GauldurDelegate.Activate(Game.GetPlayer())
Utility.Wait(0.5)
MusicActivator2.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Sigdis.GetActorRef().RestoreAV("Health", 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Utility.Wait(0.5)
(PedestalManager as dunReachwaterRockPedestalManager).EnableSupplementalBeams()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SarcophagusLid  Auto  

ReferenceAlias Property Gauldur  Auto  

Spell Property dunReachwaterRockGauldurSpell  Auto  

ReferenceAlias Property Sigdis  Auto  

ReferenceAlias Property Mikrul  Auto  

ReferenceAlias Property Jyrik  Auto  

ObjectReference Property PedestalManager  Auto  

ObjectReference Property GauldurDelegate  Auto  

ObjectReference Property JyrikDelegate  Auto  

ObjectReference Property MikrulDelegate  Auto  

ObjectReference Property SigdisDelegate  Auto  

Sound Property RumbleSFX  Auto  

ReferenceAlias Property MusicActivator2  Auto  
