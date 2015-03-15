;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 39
Scriptname _Arissa_Frag_MQ01_10 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OptGuard4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OptGuard4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arissa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arissa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OptGuard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OptGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OptGuard5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OptGuard5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OptGuard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OptGuard3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Removed
;_Arissa_MQ01_JailBreak.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_33 in script _Arissa_Frag_MQ01_10
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Beat up the player
Game.ForceFirstPerson()
_Arissa_HitSound.Play(Game.GetPlayer())
GetHit.Apply()
Game.DisablePlayerControls(true,true,true,true,true,true)
Game.GetPlayer().PlayIdle(TG05_KnockOut)
utility.Wait(0.1)
_Arissa_HitSound.Play(Game.GetPlayer())
GetHit.Apply()
;UnconsciousAudioRef goes here
utility.Wait(1)
FadeToBlackImod.ApplyCrossFade()
utility.Wait(1.1)
PHYGenericDirtHeavyH.Play(Game.GetPlayer())
utility.Wait(0.1)
PHYGenericDirtHeavyH.Play(Game.GetPlayer())
utility.wait(0.8)
PHYGenericDirtHeavyH.Play(Game.GetPlayer())
utility.Wait(0.3)
FadeToBlackImod.PopTo(FadeToBlackHoldImod)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
_Arissa_MQ01_HitAndRunTriggerREF.Enable()
_Arissa_MQ01_OutsideInnTriggerRef.Enable()
Alias_Arissa.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
debug.notification("[Arissa] MQ01 Start")
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Game.GetPlayer().MoveTo(_Arissa_MQ01_PlayerWakeUpMarker)
FadeToBlackHoldImod.PopTo(SleepyTimeFadeIn)
Game.GetPlayer().PlayIdle(Idle_1stPersonWoozyGetUpFromBed)
SetObjectiveFailed(10)
utility.wait(1)
_Arissa_MQ01_IntroMT.Add()

;Arissa 1.2 - Select the new guard
if FalkJarl.GetActorRef() == Siddgeir
    Alias_Guard2.ForceRefTo(_Arissa_Guard2ImperialREF)
else
    Alias_Guard2.ForceRefTo(_Arissa_Guard2SonsREF)
endif
utility.wait(0.2)

;Continue
_Arissa_MQ01_HitAndRun.Start()
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
Alias_Arissa.GetActorReference().SetCrimeFaction(none)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
Alias_Arissa.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Player decided to kill Arissa.
Alias_Arissa.GetActorReference().SetCrimeFaction(none)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Removed
;_Arissa_MQ01_GoToJailScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;"Why did you help me?" / "We make a pretty good team...
Alias_Arissa.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Player decided to save Arissa from the guards.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Player sent to jail while Arissa already in jail in Falkreath
Alias_Arissa.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property TG05_KnockOut  Auto  

ImageSpaceModifier Property TG05SequenceImod  Auto  

Idle Property Idle_1stPersonWoozyGetUpFromBed  Auto  

ImageSpaceModifier Property SleepyTimeFadeIn  Auto  

ImageSpaceModifier Property GetHit  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackImod  Auto  

Sound Property PHYGenericDirtHeavyH  Auto  

Sound Property _Arissa_HitSound  Auto  

ObjectReference Property _Arissa_MQ01_PlayerWakeUpMarker  Auto  

Scene Property _Arissa_MQ01_HitAndRun  Auto  

ObjectReference Property _Arissa_MQ01_HitAndRunTriggerREF  Auto  

ObjectReference Property _Arissa_MQ01_OutsideInnTriggerRef  Auto  

Faction Property CrimeFactionFalkreath  Auto

MusicType Property _Arissa_MQ01_IntroMT  Auto  

Quest Property _Arissa_MQ02  Auto  

ReferenceAlias Property FalkJarl  Auto  

Actor Property Siddgeir  Auto  

Actor Property DengeirREF  Auto  

Actor Property _Arissa_Guard2ImperialREF  Auto  

Actor Property _Arissa_Guard2SonsREF  Auto  
