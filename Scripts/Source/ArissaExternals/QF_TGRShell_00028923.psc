;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 67
Scriptname QF_TGRShell_00028923 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DelvinMalloryAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DelvinMalloryAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VexAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Forgery Quest from Delvin
kmyQuest.pTGRadiantStartFO.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Solitude Capper Quest Complete
kmyQuest.TGStatusCheck()
kmyQuest.pSolitude.Value = 1
kmyQuest.pTGRCapCount += 1
pSolitudeCache.Enable()
if kmyQuest.pTGRCapCount >= 4
kmyQuest.pTGRShellScript.TGLeaderCheck()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Housecleaning Radiant Quest Done - Failed
kmyQuest.pTGRHCQuest.SetStage(250)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRHCRun = 0
pFailVex.Value = 0
kmyQuest.pTGRArrestVex.Value = 0
kmyQuest.pTGRQuitVex.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Shoplifting Radiant Quest Done
kmyQuest.pTGRSLQuest.SetStage(200)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRSLRun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Shoplifting Quest from Vex
kmyQuest.pTGRadiantStartSL.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Start-Up Solitude Capper Quest
kmyQuest.pTGTQ02Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Gone Fishing Radiant Quest Done
kmyQuest.pTGRGFQuest.SetStage(200)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRGFRun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Markarth Capper Quest Complete
kmyQuest.TGStatusCheck()
kmyQuest.pMarkarth.Value = 1
kmyQuest.pTGRCapCount += 1
pMarkarthCache.Enable()
if kmyQuest.pTGRCapCount >= 4
kmyQuest.pTGRShellScript.TGLeaderCheck()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Markarth Capper Quest Assigned
if kmyQuest.pTGRFirstCap == 0
kmyQuest.pTGRFirstCap += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Shoplifting Radiant Quest Done - Failed
kmyQuest.pTGRSLQuest.SetStage(250)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRSLRun = 0
pFailVex.Value = 0
kmyQuest.pTGRArrestVex.Value = 0
kmyQuest.pTGRQuitVex.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Frame-Up Quest from Vex
kmyQuest.pTGRadiantStartDU.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Gone Fishing Quest from Delvin
kmyQuest.pTGRadiantStartGF.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Gone Fishing Radiant Quest Done - Failed
kmyQuest.pTGRGFQuest.SetStage(250)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRGFRun = 0
pFailDelv.Value = 0
kmyQuest.pTGRArrestDelvin.Value = 0
kmyQuest.pTGRQuitDelvin.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Guild Master Trigger
;If TG Questline has been completed and all capper quests completed
pTGLQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Plunder Quest from Delvin
kmyQuest.pTGRadiantStartNT.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Frame-Up Radiant Quest Done - Failed
kmyQuest.pTGRDUQuest.SetStage(250)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRDURun = 0
pFailVex.Value = 0
kmyQuest.pTGRArrestVex.Value = 0
kmyQuest.pTGRQuitVex.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Housecleaning Quest from Vex
kmyQuest.pTGRadiantStartHC.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Whiterun Capper Quest Complete
kmyQuest.TGStatusCheck()
kmyQuest.pWhiterun.Value = 1
kmyQuest.pTGRCapCount += 1
pWhiterunCache.Enable()
if kmyQuest.pTGRCapCount >= 4
kmyQuest.pTGRShellScript.TGLeaderCheck()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Player chose a Breaking and Entering Quest from Vex
kmyQuest.pTGRadiantStartBE.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;All Capper Quests Complete
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Start-Up Windhelm Capper Quest
kmyQuest.pTGTQ04Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Night on the Town Radiant Quest Done
kmyQuest.pTGRNTQuest.SetStage(200)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRNTRun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Whiterun Capper Quest Assigned
if kmyQuest.pTGRFirstCap == 0
kmyQuest.pTGRFirstCap += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Frame-Up Radiant Quest Done
kmyQuest.pTGRDUQuest.SetStage(200)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRDURun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Start-Up Markarth Capper Quest
kmyQuest.pTGTQ01Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Solitude Capper Quest Assigned
if kmyQuest.pTGRFirstCap == 0
kmyQuest.pTGRFirstCap += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Breaking and Entering Radiant Quest Done
kmyQuest.pTGRBEQuest.SetStage(200)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRBERun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Housecleaning Radiant Quest Done
kmyQuest.pTGRHCQuest.SetStage(200)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRHCRun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Night on the Town Radiant Quest Done - Failed
kmyQuest.pTGRNTQuest.SetStage(250)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRNTRun = 0
pFailDelv.Value = 0
kmyQuest.pTGRArrestDelvin.Value = 0
kmyQuest.pTGRQuitDelvin.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Breaking and Entering Radiant Quest Done - Failed
kmyQuest.pTGRBEQuest.SetStage(250)
kmyQuest.pTGRVexRunning = 0
kmyQuest.pTGRBERun = 0
pFailVex.Value = 0
kmyQuest.pTGRArrestVex.Value = 0
kmyQuest.pTGRQuitVex.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Forgery Radiant Quest Done - Failed
kmyQuest.pTGRFOQuest.SetStage(250)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRFORun = 0
pFailDelv.Value = 0
kmyQuest.pTGRArrestDelvin.Value = 0
kmyQuest.pTGRQuitDelvin.Value = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Forgery Radiant Quest Done
kmyQuest.pTGRFOQuest.SetStage(200)
kmyQuest.pTGRDelvinRunning = 0
kmyQuest.pTGRFORun = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Windhelm Capper Quest Assigned
if kmyQuest.pTGRFirstCap == 0
kmyQuest.pTGRFirstCap += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Windhelm Capper Quest Complete
kmyQuest.TGStatusCheck()
kmyQuest.pWindhelm.Value = 1
kmyQuest.pTGRCapCount += 1
pWindhelmCache.Enable()
if kmyQuest.pTGRCapCount >= 4
kmyQuest.pTGRShellScript.TGLeaderCheck()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN AUTOCAST TYPE TGRShellScript
Quest __temp = self as Quest
TGRShellScript kmyQuest = __temp as TGRShellScript
;END AUTOCAST
;BEGIN CODE
;Start-Up Whiterun Capper Quest
kmyQuest.pTGTQ03Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGLQuest  Auto  

GlobalVariable Property pFailVex  Auto  

GlobalVariable Property pFailDelv  Auto  
ObjectReference Property pWindhelmCache Auto
ObjectReference Property pWhiterunCache Auto
ObjectReference Property pSolitudeCache Auto
ObjectReference Property pMarkarthCache Auto
