;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_dunAlftandQST_0003B0FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sulla
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sulla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Umana
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Umana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_AlftandLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Yag
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Yag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jzhar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Jzhar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jdarr
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Jdarr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitKey
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Endrast
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Endrast Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;EndScene decide which to play
if EnteredFromBlackreach
	setStage(82)
else
	setStage(81)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;tracking that the player is coming from the Blackreach Side
EnteredFromBlackreach = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Tracking that the player is coming from the alftand side
EnteredFromBlackreach = False
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;EndScene approached from Alftand Side
EndWaitScene.stop()
EndScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;EndScene approached from Blackreach Side
EndWaitScene.stop()
EndSceneBR.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Sulla Killed
SullaKilled = True

if UmanaKilled && JdarrKilled
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Jdarr killed
JdarrKilled = True

if UmanaKilled && SullaKilled
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Shutdown
AlftandLocation.clear()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Umana killed
UmanaKilled = True

if SullaKilled && JdarrKilled 
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Cannibal Scene with Jdarr Complete
(alias_Jdarr.getReference() as actor).addToFaction(banditFaction)
(alias_Jdarr.getReference() as actor).setActorValue("aggression", 2)
(alias_Jdarr.getReference() as actor).evaluatePackage()
secondJdarrSceneEnded = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;first jdarr scene is over
CannibalScene.start()
(alias_Jdarr.getReference() as actor).evaluatePackage()
firstJdarrSceneEnded = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE QF_dunAlftandQST_0003B0FB
Quest __temp = self as Quest
QF_dunAlftandQST_0003B0FB kmyQuest = __temp as QF_dunAlftandQST_0003B0FB
;END AUTOCAST
;BEGIN CODE
;EndScene over actors become hostile
(alias_Sulla.getReference() as actor).removeFromFaction(dunPrisonerFaction)
;(alias_Sulla.getReference() as actor).addToFaction(banditFaction)
(alias_Sulla.getReference() as actor).setActorValue("aggression", 2)
(alias_Sulla.getReference() as actor).evaluatePackage()
kmyQuest.dunAlftandSullaHostileFaction.setEnemy(dunAlftandUmanaHostileFaction)
kmyQuest.dunAlftandSullaHostileFaction.setEnemy(PlayerFaction)

(alias_Umana.getReference() as actor).removeFromFaction(dunPrisonerFaction)
kmyQuest.dunAlftandUmanaHostileFaction.setEnemy(dunAlftandSullaHostileFaction)
kmyQuest.dunAlftandUmanaHostileFaction.setEnemy(PlayerFaction)
;(alias_Umana.getReference() as actor).addToFaction(banditFaction)
(alias_Umana.getReference() as actor).setActorValue("aggression", 2)
(alias_Umana.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bool Property EnteredFromBlackreach = FALSE Auto  

scene Property CannibalScene  Auto  

scene Property EndScene  Auto  

scene Property EndSceneBR  Auto  

faction Property BanditFaction  Auto  

bool Property firstJdarrSceneEnded  Auto  

bool Property secondJdarrSceneEnded  Auto  

bool Property JdarrKilled = false Auto  

bool Property SullaKilled = false Auto  

bool Property UmanaKilled = false Auto  

faction Property dunPrisonerFaction  Auto  

scene Property EndWaitScene  Auto  

faction Property dunAlftandSullaHostileFaction  Auto  

faction Property dunAlftandUmanaHostileFaction  Auto  

Faction Property PlayerFaction  Auto  

LocationAlias Property AlftandLocation  Auto  
