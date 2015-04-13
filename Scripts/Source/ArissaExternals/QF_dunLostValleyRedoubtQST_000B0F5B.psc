;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunLostValleyRedoubtQST_000B0F5B Extends Quest Hidden Conditional

;BEGIN ALIAS PROPERTY BriarHeart
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BriarHeart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SharpeningWheelGuy
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SharpeningWheelGuy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hagraven01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeartChatterGuy
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BriarHeartChatterGuy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hagraven02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeartChatterGuy02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BriarHeartChatterGuy02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;ChatterSceneComplete

chatterSceneComplete = True

if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Sharpening Scene complete

sharpeningSceneComplete = True

if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE QF_dunLostValleyRedoubtQST_000B0F5B
Quest __temp = self as Quest
QF_dunLostValleyRedoubtQST_000B0F5B kmyQuest = __temp as QF_dunLostValleyRedoubtQST_000B0F5B
;END AUTOCAST
;BEGIN CODE
;Hagraven Scene has ended activate Briarheart
briarheartSceneComplete = True

if kmyQuest.ritualComplete
	alias_Briarheart.getReference().activate(alias_Briarheart.getReference())
else
	alias_Briarheart.getActorReference().kill(game.getPlayer())
endif

BossTrigger.Enable()
if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;All Scenes complete stop quest

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bool Property sharpeningSceneComplete  Auto  

bool Property ChatterSceneComplete  Auto  

bool Property briarheartSceneComplete  Auto  

ObjectReference Property BossTrigger  Auto  

bool Property ritualComplete = false Auto  

bool Property HagravensAttacked = false Auto Conditional

function setHagravensAttacked()
	HagravensAttacked = true
endFunction
