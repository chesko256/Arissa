Scriptname NightMotherCoffinScript extends ObjectReference

int Property pInCoffin  Auto  
int Property pCoffinEscape  Auto  
Scene Property pCiceroNightMotherScene  Auto  
ObjectReference Property pNMotherCofChambMarker  Auto  
ObjectReference Property pCiceroOutChamberMarker  Auto  
ObjectReference Property pCiceroNMotherTalkMarker  Auto  
ObjectReference Property pAstridOutsideChambMarker  Auto  
ObjectReference Property pAstridNMChamberMarker  Auto  
Scene Property pAstridNMEnterScene  Auto  
ReferenceAlias Property pCiceroAlias  Auto  
ReferenceAlias Property pAstridAlias  Auto
Quest Property db04 auto
Quest Property DB10  Auto  
Scene Property NazirBabetteScene  Auto  
ObjectReference Property NightMotherCoffinWater  Auto  
ObjectReference Property NazirLakeMarker  Auto  
ObjectReference Property BabetteLakeMarker  Auto  
ObjectReference Property PlayerLakeMarker  Auto  
ObjectReference Property DBSanc_NMCoffinLightToggle Auto
ImagespaceModifier property NMCoffinBlackIS Auto
ImagespaceModifier property NMCoffinFullBlackIS Auto


Event OnTriggerEnter(ObjectReference akActionRef)
If(Game.getPlayer().GetRace()==WerewolfBeastRace)
	Return
Endif

if (akActionRef == Game.GetPlayer())
	if (pInCoffin == 0)
		if (db04.GetStage() == 10)
			;if (Game.GetPlayer().HasLOS(HeadAlias.GetReference()))
				Game.DisablePlayerControls(ablooking = true, abCamSwitch = true)
	                    Game.ForceFirstPerson()
				Game.GetPlayer().MoveTo(PlayerCoffinMarker)
				;Game.GetPlayer().TranslateToRef(TranslateMarker, 100, 100)
				Utility.Wait(1)
				CoffinCloseSound.Play(Coffin)
				DBSanc_NMCoffinLightToggle.Disable()
				NMCoffinBlackIS.ApplyCrossfade(1.25) 
				Utility.Wait(1.25)
				db04.SetStage(20)
				;Game.SetPlayerAIDriven(True)
				pNazirAlias.GetActorRef().StopCombat()
				(Game.GetPlayer() as Actor).StopCombatAlarm()
				pCiceroAlias.GetRef().Moveto(pCiceroOutChamberMarker)
				pCiceroNightMotherScene.Start()
				pInCoffin=1
			;endif
		endif
	endif
endif


if (akActionRef == Game.GetPlayer())
	;if Game.GetPlayer().IsInCombat() == 0
	if pNazirAlias.GetActorRef().IsInCombat() == 0
		If(DB10.GetStage()==50)
			if (pCoffinEscape == 0)
			;if (Game.GetPlayer().HasLOS(HeadAlias.GetReference()))
				;Game.GetPlayer().TranslateToRef(TranslateMarker, 100, 100)
				Game.DisablePlayerControls(ablooking = true, abCamSwitch = true)
				Game.ForceFirstPerson()
				Game.GetPlayer().MoveTo(PlayerCoffinMarker)
				Utility.Wait(1)
				CoffinCloseSound.Play(Coffin)
				NMCoffinBlackIS.ApplyCrossfade(1.25) 
				Utility.Wait(2)
				CoffinCrashSound.Play(Coffin)
		             pDB10Script Script = DB10 as pDB10Script
   	                 Script.NazirStand = 1
   	                 Body.PlayAnimation("playanim02")
				;Utility.Wait(3)
				Utility.Wait(9)
				NightMotherSleepScene.Start()
				Utility.Wait(2)
				Body.PlayAnimation("playanim01")
				Utility.Wait(5)
				NMCoffinFullBlackIS.ApplyCrossfade(0.25) 
              	      ;Debug.MessageBox("NightMotherCrash")
				pBabetteAlias.GetReference().Enable()
				NightMotherCoffinWater.Enable()
				NightMotherCorpseWater.Enable()
				pNazirAlias.GetReference().Moveto(NazirLakeMarker)
				pBabetteAlias.GetReference().Moveto(BabetteLakeMarker)
				DB10.SetStage(55)
				DBSanc_NMCoffinLightToggle.Disable()
				Utility.Wait (10)
				Game.GetPlayer().MoveTo(PlayerLakeMarker)
				NazirBabetteScene.Start()
				pCoffinEscape=1
			;Endif
			endif
		Endif
	Endif
Endif

EndEvent





;/Event OnUpdate()

;Debug.MessageBox("NightMotherCoffinScriptUpdating")
If (pInCoffin==0)
	If GetOwningQuest().GetStage()==10
		If Game.GetPlayer().GetDistance(pNMotherCofChambMarker) <= 100
			Game.DisablePlayerControls()
			GetOwningQuest().SetStage(20)
			pCiceroAlias.GetRef().Moveto(pCiceroOutChamberMarker)
			(GetOwningQuest() as DB04Script).Eavesdrop=1
			pInCoffin=1
			pCiceroNightMotherScene.Start()
		Endif
	Endif
Endif

If (pInCoffin==1)
	If (pCiceroAlias.GetRef().GetDistance(pCiceroNMotherTalkMarker) <= 100)
		pInCoffin=2
	Endif
Endif


If (GetOwningQuest() as DB04Script).Listener==3
	If (GetOwningQuest() as DB04Script).AstridInvolved==0
		;pAstridAlias.GetRef().MoveTo (pAstridNMChamberMarker) 
		 (GetOwningQuest() as DB04Script).AstridInvolved=1
	Endif
Endif

If (GetOwningQuest() as DB04Script).AstridInvolved==1
	If (pAstridAlias.GetRef().GetDistance(pAstridNMChamberMarker) <= 100)
		;pAstridNMEnterScene.Start()
		 (GetOwningQuest() as DB04Script).AstridInvolved=2
	endif
endif


EndEvent
/;



ReferenceAlias Property pNazirAlias  Auto  

ReferenceAlias Property pBabetteAlias  Auto  

ReferenceAlias Property pNightMother  Auto  

ObjectReference Property pNightMotherMoveMarker  Auto  

ObjectReference Property Coffin  Auto  

ObjectReference Property ChamberDoor  Auto  

sound Property CoffinCloseSound  Auto  

ObjectReference Property Head  Auto  

ReferenceAlias Property HeadAlias  Auto  

Scene Property NightMotherSleepScene  Auto  

ObjectReference Property NightMotherCorpseWater  Auto  

ObjectReference Property TranslateMarker  Auto  

ObjectReference Property PlayerCoffinMarker  Auto  

ObjectReference Property Body  Auto  

sound Property CoffinCrashSound  Auto  

race Property WerewolfBeastRace  Auto  
