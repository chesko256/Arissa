;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_dunTolvaldsCaveQST_0003CD36 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ghost01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghost01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhostCrown03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostCrown03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghost03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhostCrown02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostCrown02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ghost02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhostCrown01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostCrown01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Start third ghost scene
if !ghostScene3Complete
	ghostScene3Complete = True
	dunTolvaldsCaveGhostScene03.start()
endif

if ghostScene1Complete && ghostScene2Complete && ghostScene3Complete && crownSceneComplete
	setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Trap Evaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Start second ghost scene
if !ghostScene2Complete
	ghostScene2Complete = True
	dunTolvaldsCaveGhostScene02.start()
endif

if ghostScene1Complete && ghostScene2Complete && ghostScene3Complete && crownSceneComplete
	setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Trap Sprung
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;End Quest
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Start attack at crown
if !crownSceneComplete
	crownSceneComplete = True
	dunTolvaldsCaveCrownScene.start()
endif

if ghostScene1Complete && ghostScene2Complete && ghostScene3Complete && crownSceneComplete
	setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE QF_dunTolvaldsCaveQST_0003CD36
Quest __temp = self as Quest
QF_dunTolvaldsCaveQST_0003CD36 kmyQuest = __temp as QF_dunTolvaldsCaveQST_0003CD36
;END AUTOCAST
;BEGIN CODE
;Start first ghost scene
if !ghostScene1Complete
	ghostScene1Complete = True
	dunTolvaldsCaveGhostScene01.start()
endif

if ghostScene1Complete && ghostScene2Complete && ghostScene3Complete && crownSceneComplete
	setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property dunTolvaldsCaveGhostScene01  Auto  

Scene Property dunTolvaldsCaveGhostScene02  Auto  

Scene Property dunTolvaldsCaveGhostScene03  Auto  

Scene Property dunTolvaldsCaveCrownScene  Auto  

bool Property GhostScene1Complete = False Auto  

bool Property GhostScene2Complete  Auto  

bool Property GhostScene3Complete  Auto  

bool Property CrownSceneComplete = false Auto  
