Scriptname TG03QuestScript extends Quest  Conditional

int Property pTG03MallusInfo  Auto  Conditional
int Property pTG03SabjornJobs  Auto  Conditional
int Property pTG03QuestFailure Auto Conditional
int Property pTG03ExileMode  Auto  Conditional
int Property pTG03CellCleared Auto Conditional
int Property pDia01 Auto Conditional
int Property pDia02 Auto Conditional
int Property pDia03 Auto Conditional
int Property pTG03PayMe Auto Conditional
Alias Property pTG03BrynjolfAlias  Auto  Conditional
Alias Property pTG03BrewingVat  Auto  Conditional
Alias Property pTG03MallusAlias  Auto  Conditional
Alias Property pTG03SabjornAlias  Auto  Conditional
Book Property pTG03SabjornNote Auto Conditional
GlobalVariable Property pTG03Failure Auto Conditional
Quest Property pTG03 Auto Conditional
Quest Property pTG03SPQuest Auto Conditional
Quest Property pTG04  Auto  Conditional
Quest Property pTGPostQuest Auto Conditional
MiscObject Property pTG03Poison Auto Conditional
Key Property pTG03MeaderyKey  Auto  Conditional
Key Property pTG03MeaderyOfficeKey  Auto  Conditional
ObjectReference Property pTG03SabjornMarker Auto Conditional
ObjectReference Property pTG03CaptainMarker Auto Conditional
ObjectReference Property pTG03MallusMarker Auto Conditional
ObjectReference Property pTG03EimarMarker Auto Conditional
ObjectReference Property pTG03InnMarker  Auto  Conditional
Location Property pTG03HonningbrewLoc Auto Conditional
Faction Property pTG03TGFaction Auto Conditional
ObjectReference Property pTG03SkeeverEnabler  Auto  Conditional
ObjectReference Property pHonningbrewFrontDoorRef  Auto  Conditional
Cell Property pHonningbrewMeadery01 Auto Conditional
ReferenceAlias Property pSabjornAlias Auto
ReferenceAlias Property pMallusAlias Auto
ReferenceAlias Property pEimarAlias Auto
GlobalVariable Property pTGHonningbrewPackages Auto

Function PrepTheMeadery()

	pTGHonningbrewPackages.Value = 1
	pHonningbrewMeadery01.SetPublic()
	pHonningbrewFrontDoorRef.Lock(false)
	pHonningbrewFrontDoorRef.SetFactionOwner( NONE )
	pSabjornAlias.GetActorRef().EvaluatePackage()
	pMallusAlias.GetActorRef().EvaluatePackage()
	pEimarAlias.GetActorRef().EvaluatePackage()

endFunction