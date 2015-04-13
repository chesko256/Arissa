Scriptname DarkwaterDerkeethusRescueScript extends Quest Conditional


ReferenceAlias Property Derkeethus auto
ReferenceAlias Property DerkeethusSpot auto

bool Property DerkeethusHeadingHome auto conditional
bool Property DerkeethusShouldForceGreet auto conditional


Function Setup()
	Derkeethus.GetReference().Enable()
	Derkeethus.GetReference().MoveTo(DerkeethusSpot.GetReference())
EndFunction

Function LeftCavern()
	DerkeethusShouldForceGreet = true
	Derkeethus.GetActorReference().EvaluatePackage()
EndFunction
