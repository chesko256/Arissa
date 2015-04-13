;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunYngolBarrowQST_000434A3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LocationAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY entryPortcullis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_entryPortcullis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mote01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mote01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Yngol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Yngol Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE QF_dunYngolBarrowQST_000434A3
Quest __temp = self as Quest
QF_dunYngolBarrowQST_000434A3 kmyQuest = __temp as QF_dunYngolBarrowQST_000434A3
;END AUTOCAST
;BEGIN CODE
mote01Ref.activate(game.getPlayer())
YngolRemainsEnabler.enable()
; if the player enters Yngol barrow before getting the related FF quest in Winterhold, just never have that appear.
if freeformWinterholdA.getStageDone(10) == FALSE
freeformWinterholdA.stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE QF_dunYngolBarrowQST_000434A3
Quest __temp = self as Quest
QF_dunYngolBarrowQST_000434A3 kmyQuest = __temp as QF_dunYngolBarrowQST_000434A3
;END AUTOCAST
;BEGIN CODE
; set up stage for the boss encounter
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE QF_dunYngolBarrowQST_000434A3
Quest __temp = self as Quest
QF_dunYngolBarrowQST_000434A3 kmyQuest = __temp as QF_dunYngolBarrowQST_000434A3
;END AUTOCAST
;BEGIN CODE
;mote01Ref.activate(game.getPlayer())
;SetObjectiveDisplayed(0,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE QF_dunYngolBarrowQST_000434A3
Quest __temp = self as Quest
QF_dunYngolBarrowQST_000434A3 kmyQuest = __temp as QF_dunYngolBarrowQST_000434A3
;END AUTOCAST
;BEGIN CODE
;setObjectiveCompleted(50)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
objectReference mote01Ref 
objectReference entryPortcullisRef
EVENT onInit()
	mote01Ref = alias_mote01.getReference()
	entryPortcullisRef = alias_entryPortcullis.getReference()
endEVENT

Quest Property FreeformWinterholdA  Auto  

ObjectReference Property YngolRemainsEnabler  Auto  
