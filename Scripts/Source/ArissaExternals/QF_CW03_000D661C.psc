;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_CW03_000D661C Extends Quest Hidden

;BEGIN ALIAS PROPERTY ImperialFieldCO
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialFieldCO Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalgruufAlive
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalgruufAlive Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Galmar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Galmar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalgruufDead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalgruufDead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Irileth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Irileth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Proventus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Proventus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialScoutEnsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialScoutEnsMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialScoutStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialScoutStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ImperialScout
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ImperialScout Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AxeUlfrics
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AxeUlfrics Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunDragonsreach
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_WhiterunDragonsreach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Message
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Message Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AxeBalgruufs
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AxeBalgruufs Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapTableFloorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapTableFloorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AxeHrongars
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AxeHrongars Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MessageFromTullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MessageFromTullius Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;balgruuf gave player axe to deliver to Ulfric
setObjectiveCompleted(20)
setObjectiveDisplayed(50)

kmyquest.GivePlayerMessageToUlfric()    ;creates and shoves into aliases that give it proper name

if kmyquest.CWs.PlayerAllegiance == 2 ;Stormcloak
	kmyquest.StartWhiterunAttack()   ;start the siege set up so it's ready when Ulfric sends him to the front lines
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;player delivered message
;set in dialogue
setObjectiveCompleted(10)
setObjectiveCompleted(11)

kmyquest.JarlTakesMessage()   ;removes from player and deletes it
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;player returned axe to Ulfric, start scene where he announces the attack on whiterun
kmyquest.CW03ToWarScene.Start()
setObjectiveCompleted(50)
setObjectiveDisplayed(225)

Alias_Ulfric.GetReference().AddItem(Alias_Message.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;ulfric returns the axe
setObjectiveCompleted(50)
setObjectiveDisplayed(100)

Alias_ImperialScout.GetReference().Enable()
Alias_ImperialScout.GetReference().MoveTo(Alias_ImperialScoutStartMarker.GetReference())
kmyquest.CW03SiegeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;QUICK START IMPERIAL
; debug.trace("CW03 Quick Start...")
kmyquest.CWs.CW01A.SetStage(200)
setStage(10)
; debug.trace("CW03 Quick Start Finished.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;Ulfric sent the player out to war, turn on the siege
;debug.messageBox("CW03 Stage 240: Enable the Siege of Whiterun")

; CWScript.Log("CW03", "CW03 Stage 240, calling CWSiege.SetStage(1)")
kmyquest.CWs.CWSiegeS.SetStage(1)

; CWScript.Log("CW03", "CW03 Stage 240,stoping CW03")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;QUICK START SONS
; debug.trace("CW03 Quick Start...")
kmyquest.CWs.CW01B.SetStage(200)
setStage(10)
; debug.trace("CW03 Quick Start Finished.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;war speech is done, Ulfric should forcegreet player (set in scene)
Alias_Ulfric.GetActorReference().EvaluatePackage()
setObjectiveCompleted(225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_ImperialScout.GetReference().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("CW03 Stage 20")

;just in case we didn't take the message already
setStage(15)

;start the scene
setObjectiveCompleted(11)  ;may or may not have this active
setObjectiveCompleted(16)  ;may or may not have this active

setObjectiveDisplayed(20) 

kmyquest.MQ104OutroScene.stop()

kmyquest.CW03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;player gave message, but there are MQ tasks still to complete
;set in dialogue
setObjectiveDisplayed(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
if kmyquest.CWs.PlayerAllegiance == 1
	setObjectiveDisplayed(10)

; 	CWScript.Log("CW03", "Stage 10 disabling Ralof")
	kmyquest.CWs.RalofRef.Disable()

else
	setObjectiveDisplayed(11)

; 	CWScript.Log("CW03", "Stage 10 disabling Hadvar")
	kmyquest.CWs.HadvarRef.Disable()

endif

kmyquest.GivePlayerMessageToWhiterun()  ;creates and shoves it into aliases that give it name
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;FieldCO told the ImperialScout to move it (in scene) condition on ImperialScout alias package
Alias_ImperialScout.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;set in CWSiege stage 1 where we start the siege from the field legate

SetObjectiveCompleted(150)

; CWScript.Log("CW03", "CW03 Stage 210, stopping CW03")
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;returned to balgruuf and is told to report to the field legate
setObjectiveCompleted(100)

setObjectiveDisplayed(150)

Alias_Balgruuf.GetReference().AddItem(Alias_Message.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;scene gets to the part where Balgruuf force greets the player about the axe
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE CW03Script
Quest __temp = self as Quest
CW03Script kmyQuest = __temp as CW03Script
;END AUTOCAST
;BEGIN CODE
;Scene has gotten to a point where if the playe interups he can get Balgruuf to give him the axe
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;siege setup scene ended
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
