Scriptname MonitorAliveCountScript extends Quest  
{Used in conjunction with MonitorAliveCountAliasScript to set a stage when the LocRefType alive count is zero for a location, checked every time an alias with MonitorAliveCountAliasScript dies.}

;jduvall -- this is used for DA02. Please don't change it without talking to me. It's fairly generic. Feel free to use it. If you do, add name of quest to the list below so if I make changes I'll consult you.
;It may be of limited use because it's so dependent on everthing you want to count having a specific location ref types.

;Quests using this script system:
;DA02

LocationAlias Property LocationAliasToMonitor Auto
{Which location alias's location has the ref types we are monitoring}

LocationRefType Property LocationRefTypeToMonitor Auto
{Which LocationRefType are we monitoring?}

Int Property StageToSet Auto
{Which quest stage should we set when GetRefTypeAliveCount hits CountTarget OR BELOW}

int Property CountTarget = 0 auto
{Default 0; when GetRefTypeAliveCount returns this number, set stage in StageToSet}

Actor Property CheckSpecificActor = None Auto  ;added patch 1.4 for DA02 bug
{Default None; if this is set, it means don't set the quest stage if this actor isn't also dead}

Int Property StageToSetAlso Auto ;Added patch 1.4 for DA02 bug
{Which ADDITIONAL quest stage should we ALSO set when GetRefTypeAliveCount hits CountTarget OR BELOW}


function CheckAliveCount()
{function called by OnDeath block of alias in this quest having the MonitorAliveCountAliasScript attached to it}


; 	debug.trace(self + "CheckAliveCount()")
	
	Location LocationToMonitor = LocationAliasToMonitor.GetLocation()
	
	int AliveCount = LocationToMonitor.GetRefTypeAliveCount(LocationRefTypeToMonitor)
	
; 		debug.trace(self + "CheckAliveCount() Location: " + LocationToMonitor +  "; LocationRefTypeToMonitor: " + LocationRefTypeToMonitor + "; AliveCount: " + AliveCount + "; CountTarget: " + CountTarget)
	
	if  AliveCount <= CountTarget
; 		debug.trace(self + "CheckAliveCount() CountTarget reached, setting quest stage [" + StageToSet +  "]")
		
		;added patch 1.4 for DA02 bug
		if CheckSpecificActor == false || (CheckSpecificActor && CheckSpecificActor.IsDead())
			setStage(stageToSet)
			
			if StageToSetAlso
				setStage(stageToSetAlso)
			endif
			
		Else
			debug.trace(self + "CheckSpecificActor (" + CheckSpecificActor + ") is not dead, so not setting stage.")
		
		EndIf
	Else
; 		debug.trace(self + "CheckAliveCount() CountTarget NOT reached, doing nothing.")
		
	EndIf

EndFunction
