;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 62
Scriptname QF_DA14_0001BB9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY DA14PriestessAwakenMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14PriestessAwakenMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Samwell
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Samwell Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Priestess2AwakenMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Priestess2AwakenMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Wine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Wine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14SamEndMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14SamEndMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Ennis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Ennis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14HolyWater
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14HolyWater Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14GiantAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14GiantAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14MorvunskarMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14MorvunskarMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14YsoldaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14YsoldaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14GiantsClub
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14GiantsClub Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14HagravenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14HagravenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14PlayerAwakenMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14PlayerAwakenMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14WeddingRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14WeddingRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14BrokenStaff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14BrokenStaff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Sanguine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Sanguine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SanguineRose
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SanguineRose Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14SammyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14SammyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14MorvunskarQuestTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14MorvunskarQuestTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14NoteFromSam
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14NoteFromSam Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14Senna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14Senna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14InnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14InnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14SanguinesRealmEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14SanguinesRealmEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14RoricksteadMapmarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14RoricksteadMapmarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14MorvunskarEntrance
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14MorvunskarEntrance Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14WitchmistGroveMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14WitchmistGroveMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveCompleted(85)
setObjectiveDisplayed(100)

Alias_DA14WitchmistGroveMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Set after the first NPC Greeting, starts quest.

setObjectiveDisplayed(10)  
setObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Set stage for testing - (skips DA14Start)

setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
SetObjectiveCompleted(20)
setObjectiveCompleted(30)
setObjectiveCompleted(40)
setObjectiveCompleted(50)
setObjectiveCompleted(75)
setObjectiveCompleted(85)
setObjectiveCompleted(100)
setObjectiveCompleted(115)
setObjectiveCompleted(125)
setObjectiveDisplayed(135)

Alias_DA14MorvunskarMapMarker.GetRef().AddToMap()

Alias_DA14Samwell.GetRef().moveto(alias_DA14SamEndMarker.GetRef())
Alias_DA14Samwell.GetRef().enable()
Alias_DA14Samwell.GetActorRef().setghost()
Alias_DA14SanguinesRealmEnabler.GetRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
Game.GetPlayer().Additem(DA14SanguineRose)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has blacked out at the end of DA14Start. This moves the player and starts the fade in scene.
Game.GetPlayer().moveto(alias_DA14playerawakenmarker.GetRef())

alias_DA14Senna.GetRef().moveto(alias_DA14Priestess2AwakenMarker.GetRef())
;alias_DA14Orla.GetRef().moveto(alias_DA14Priestess2AwakenMarker.GetRef())
Alias_DA14Samwell.GetRef().disable()
alias_DA14GiantAlias.getactorref().Enable()
alias_DA14SammyAlias.getactorref().Enable()
;alias_DA14GiantAlias.getactorref().allowpcdialogue(1)
alias_DA14HagravenAlias.GetRef().Enable()
alias_DA14HagravenAlias.GetActorRef().allowpcdialogue(1)

alias_DA14Wine.GetRef().enable()
alias_DA14HolyWater.GetRef().enable()
alias_DA14GiantsClub.GetRef().enable()
alias_DA14NoteFromSam.GetRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
alias_DA14SammyAlias.getactorref().allowpcdialogue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
setObjectiveCompleted(150)
setObjectiveCompleted(10)
    ;.Cast(Alias_DA14Samwell.GetRef(),Alias_DA14Samwell.GetRef())
    ;DA14TransformFX.play(Alias_DA14Samwell.GetRef(),10,game.GetPlayer())
Alias_DA14Samwell.GetRef().PlaceAtMe(SummonFX)
Utility.wait(1)
Alias_DA14Samwell.GetRef().disable()
Alias_DA14Sanguine.GetRef().moveto(Alias_DA14Samwell.GetRef())
Alias_DA14Sanguine.GetRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
setObjectiveDisplayed(100,0)
setObjectiveDisplayed(115,0)
setObjectiveDisplayed(125,0)
setstage(135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
setObjectiveCompleted(75)
setObjectiveDisplayed(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
Alias_DA14hagravenAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
setObjectiveCompleted(150)
setObjectiveDisplayed(165)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
SetObjectiveCompleted(100)
setObjectiveDisplayed(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;player has spoken to priestesses and been directed to Rorickstead

setObjectiveCompleted(20)
setObjectiveCompleted(30)
setObjectiveDisplayed(40)

Alias_DA14RoricksteadMapmarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
setObjectiveDisplayed(50,0)
setObjectiveDisplayed(75,0)
setstage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
setObjectiveCompleted(135)
setObjectiveDisplayed(150)

;Alias_DA14Samwell.GetRef().moveto(alias_DA14SamEndMarker.GetRef())
;Alias_DA14Samwell.GetRef().enable()
;Alias_DA14Samwell.GetActorRef().setghost()
;Alias_DA14SanguinesRealmEnabler.GetRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
SetObjectiveCompleted(20)
setObjectiveCompleted(30)
setObjectiveCompleted(40)
setObjectiveCompleted(50)
setObjectiveCompleted(75)
setObjectiveCompleted(85)
setObjectiveCompleted(100)
setObjectiveCompleted(115)

setObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;player has picked up his junk from around the temple.

setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;DA15End scene has ended. Player has reward. End quest.
CameraAttachFX.Stop(Game.GetPlayer())
CameraAttachFX2.Stop(Game.GetPlayer())
Game.GetPlayer().moveto(alias_DA14innmarker.GetRef())
setObjectiveCompleted(12)
AchievementsQuest.IncDaedricArtifacts()
AchievementsQuest.IncDaedricQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property DA14GoatLead  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Weapon Property DA14SanguineRose  Auto  

VisualEffect Property DA14TransformFX  Auto  

Activator Property SummonFX  Auto  

VisualEffect Property CameraAttachFX  Auto  

VisualEffect Property CameraAttachFX2  Auto  
