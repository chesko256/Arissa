Scriptname CWMapTableSceneScript extends Quest  Conditional

Quest Property ExternalQuest Auto
{An external quest who's stage we will set when the scene ends}

Int Property ExternalQuestStageToSetWhenSceneEnds Auto
{An stage in an external quest we will set when the scene ends}

int Property ScenePhase Auto Hidden Conditional
{Increments with each phase of scene, and is condition on each phase... this will allow you to interupt the scene, I call stop on it, and then restart it and it picks up from where it left off.}

bool Property ShutDownQuestOnPlayerLocationChange = true Auto
{Default = TRUE, quest should shut down if the player changes location. NOTE: This ONLY works if this QUEST is a ChangeLocation Event Radiant Story Quest, OR if you register the quest for update manually}

Scene Property myScene Auto
{Scene this quest is controlling}

int waitTime = 5

int UpdateFrequency = 5

Location NewLocation


Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	if ShutDownQuestOnPlayerLocationChange
	
; 		CWScript.Log("CWMapTableSceneScript", self + "OnStoryChangeLocation(). ShutDownQuestOnPlayerLocationChange == True, so register quest for update to poll for player change location" )
	
		NewLocation = akNewLocation
		
		RegisterForUpdate(UpdateFrequency)
	
	EndIf
	
EndEvent

Event OnUpdate()

	if ShutDownQuestOnPlayerLocationChange
	
		Location PlayerLocation = Game.GetPlayer().GetCurrentLocation()
	
; 		CWScript.Log("CWMapTableSceneScript", self + "OnUpdate(). ShutDownQuestOnPlayerLocationChange == True, checking player location:" + PlayerLocation + " against Quest NewLocation event data: " + NewLocation)

		if PlayerLocation != NewLocation
; 			CWScript.Log("CWMapTableSceneScript", self + "OnUpdate(). PlayerLocation != NewLocation calling  UnregisterForUpdate() and Stop() on quest.")

			UnregisterForUpdate()
			Stop()
		
		Else
; 			CWScript.Log("CWMapTableSceneScript", self + "OnUpdate(). PlayerLocation == NewLocation continuing to update and poll play location.")

		EndIf
		
		
	EndIf
	

EndEvent


function StartMyScene(bool WaitUntilSceneCompletes = False, int waitTimeMax = 600)
; 	CWScript.Log("CWMapTableSceneScript", self + "StartMyScene(). Calling Start() on scene: " + myScene )
	myScene.Start()
	
	if WaitUntilSceneCompletes
; 		CWScript.Log("CWMapTableSceneScript", self + "StartMyScene(). WaitUntilSceneCompletes == True.")

		Utility.wait(waitTime)
		
		int WaitingFor = WaitTime
		
		while myScene.IsPlaying() && WaitingFor < waitTimeMax
; 			CWScript.Log("CWMapTableSceneScript", self + "StartMyScene(). WaitingFor: " + WaitingFor + ", waitTimeMax =" + waitTimeMax)
			Utility.wait(waitTime)
			WaitingFor += WaitTime
		EndWhile
		
	EndIf
	
EndFunction

function StopMyScene()
; 	CWScript.Log("CWMapTableSceneScript", self + "StopMyScene(). Calling Stop() on scene: " + myScene )
	myScene.Stop()

EndFunction



Function IncrementScenePhase()

	ScenePhase += 1

; 	CWScript.Log("CWMapTableSceneScript", self + "IncrementScenePhase(). Set ScenePhase variable to " + ScenePhase )


EndFunction

function SceneEnd()
	
	if ExternalQuest && ExternalQuestStageToSetWhenSceneEnds
; 		CWScript.Log("CWMapTableSceneScript", self + "SceneEnd(). Setting stage " + ExternalQuestStageToSetWhenSceneEnds + " in quest:" + ExternalQuest)
		ExternalQuest.SetStage(ExternalQuestStageToSetWhenSceneEnds)
		
	EndIf
	
EndFunction
