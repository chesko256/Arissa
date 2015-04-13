Scriptname DBCiceroArriveTrigScript extends ObjectReference  

Quest Property DarkBrotherhoodQuest  Auto 
Scene Property pCiceroArriveScene  Auto 
Scene Property pCiceroGoneScene  Auto  
Quest Property pDB07  Auto  
Scene Property pFirstArriveScene  Auto  
  
 

Event OnTriggerEnter(ObjectReference AkActivator)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DB06Script Script = pDB06 as DB06Script

If(game.getPlayer()==AkActivator)
	if DBscript.CiceroArrive == 1
		pCiceroArriveScene.Start()
		DBscript.CiceroArrive == 2
	Endif
Endif

If(game.getPlayer()==AkActivator)
	if DBscript.CiceroGoneSceneStart == 0
		if pDB07.GetStage () == 10
			pCiceroGoneScene.Start()
			DBScript.CiceroGone=1
			DBscript.CiceroGoneSceneStart == 1	 
		Endif
	Endif
Endif

If(game.getPlayer()==AkActivator)
	if DBscript.pFirstScene == 0
		if pDB03.GetStage () < 10
			if DBDestroy.GetStage () < 10
		      		;Debug.MessageBox("Trigger hit.")
				pFirstArriveScene.Start()
				DBScript.pFirstScene=1
			endif
		Endif
	Endif
Endif



If(game.getPlayer()==AkActivator)
	if DBscript.CiceroGoneSceneStart == 0
		if pDB06.GetStage () == 30
			if Script.pBonus == 1
				pDB06.SetStage (200)
                   		pDB07.SetStage (10)
				pCiceroGoneScene.Start()
				Game.GetPlayer().AddItem(LvlQuestReward03Large)
				Game.GetPlayer().AddItem(pToken,1)
				Script.pPlantedLetter=2
				OlavaReadingQuest.SetStage (10)
				DBScript.CiceroGone=1
				DBscript.CiceroGoneSceneStart == 1
			Endif 
		Endif
	Endif
Endif

If(game.getPlayer()==AkActivator)
	if DBscript.CiceroGoneSceneStart == 0
		if pDB06.GetStage () == 30
			if Script.pBonus == 1
				pCiceroGoneScene.Start()
				pDB06.SetStage (200)
                   		pDB07.SetStage (10)
				Game.GetPlayer().AddItem(LvlQuestReward03Large)
				Game.GetPlayer().AddItem(pToken,1)
				Script.pPlantedLetter=2
				OlavaReadingQuest.SetStage (10)
				DBScript.CiceroGone=1
				DBscript.CiceroGoneSceneStart == 1
			Endif 
		Endif
	Endif
Endif

If(game.getPlayer()==AkActivator)
	if DBscript.CiceroGoneSceneStart == 0
		if pDB06.GetStage () == 30
			if Script.pBonus == 0
				pCiceroGoneScene.Start()
				pDB06.SetStage (200)
                   		pDB07.SetStage (10)
				Game.GetPlayer().AddItem(LvlQuestReward03Large)
				Script.pPlantedLetter=2
				DBScript.CiceroGone=1
				DBscript.CiceroGoneSceneStart == 1
			Endif 
		Endif
	Endif
Endif



EndEvent








Quest Property pDB03  Auto  

Quest Property DBDestroy  Auto  
Quest Property pDB06  Auto
  
MiscObject Property pToken  Auto  
Quest Property OlavaReadingQuest  Auto  
LeveledItem Property LvlQuestReward03Large  Auto  

