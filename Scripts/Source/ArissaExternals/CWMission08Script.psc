Scriptname CWMission08Script extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

faction Property CWMission08EnemyToGiant auto
faction Property CWMission08GiantPlayerAlliesFaction Auto
faction Property CWMission08AllGiantsPlayerFriendFaction Auto

scene Property CWMission08Scene1 auto
scene Property CWMission08Scene2 auto

LocationAlias Property AttackPoint Auto
int Property playerAtAttackPoint auto conditional hidden	;0 = unset, 1 = player arrived - used to control scene, making sure the player is present before the giant takes the herd and gaurds attack



CWAlliesScript Property CWAlliesS Auto	;pointer to script on CWAllies Quest

Event OnUpdate()
; 	CWScript.Log("CWMission08Script", "OnUpdate(): Stage: " + GetStage() +  ", Player loction: " + Game.GetPlayer().GetCurrentLocation() + "; AttackPoint Location:" + AttackPoint.GetLocation())

	if playerAtAttackPoint == 0 && GetStage() == 21
		if Game.GetPlayer().GetCurrentLocation() == AttackPoint.GetLocation()
; 			CWScript.Log("CWMission08Script", "OnUpdate() setting playerAtAttackPoint to 1 because player is in the same location")
		
			playerAtAttackPoint = 1
		EndIf
	
	EndIf

EndEvent
