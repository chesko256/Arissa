Scriptname dunTalkingStoneChangeLocationScript extends Quest
{Quest script for dunTalkingStoneQST. Triggers the scene on quest startup.}

Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	;Just set the stage. This doesn't work in the quest proper because of the way 'quest startup' logic works.
	Setstage(10)
EndEvent