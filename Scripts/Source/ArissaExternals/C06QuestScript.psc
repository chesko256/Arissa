Scriptname C06QuestScript extends CompanionsStoryQuest Conditional


;for debugging
Quest Property BeforePreviousQuest auto
Quest Property WayBackQuest auto
ReferenceAlias Property Skjor auto  ; on C03
ReferenceAlias Property Kodlak auto ; on C04
MiscObject Property GlenmorilHead auto
; end debugging defines

Quest Property C06PostQuest auto

ReferenceAlias Property Skyforge auto
ReferenceAlias Property Eorlund auto
ReferenceAlias Property Aela auto
ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto
ReferenceAlias Property EssentialKodlak auto ; on C00
ReferenceAlias Property EssentialSkjor auto ; on C00
ReferenceAlias Property EssentialEorlund auto ; on C00
ReferenceAlias Property EssentialAela auto ; on C00
ReferenceAlias Property EssentialVilkas auto ; on C00
ReferenceAlias Property EssentialFarkas auto ; on C00

ObjectReference Property FuneralPoint1 auto
ObjectReference Property FuneralPoint2 auto
ObjectReference Property FuneralPoint3 auto
ObjectReference Property FuneralPoint4 auto

bool Property EorlundFGAtFuneralEnd auto conditional
bool Property FarkasFGBeforeSpiders auto conditional
bool Property FarkasLeft auto conditional

bool Property WolfSpiritChill auto conditional
bool Property KodlakOUT auto conditional
ReferenceAlias Property GhostKodlak auto
EffectShader Property GhostShader auto

Armor Property VilkasHelmet auto

ReferenceAlias Property Head1 auto ; on C00
ReferenceAlias Property Head2 auto ; on C00
ReferenceAlias Property Head3 auto ; on C00
ReferenceAlias Property Head4 auto ; on C00
ReferenceAlias Property Head5 auto ; on C00

ReferenceAlias Property DeadThing1 auto ; on C00
ReferenceAlias Property DeadThing2 auto ; on C00
ReferenceAlias Property DeadThing3 auto ; on C00
ReferenceAlias Property DeadThing4 auto ; on C00
ReferenceAlias Property DeadThing5 auto ; on C00
ReferenceAlias Property DeadThing6 auto ; on C00
ReferenceAlias Property DeadThing7 auto ; on C00

ReferenceAlias Property KodlaksFragment auto
ReferenceAlias Property KodlaksJournal auto

ObjectReference Property FuneralEnabler auto
ObjectReference Property KodlakBody auto
bool Property PlayerPresentAtFuneral auto conditional
bool Property AelaForceGreetAtTomb auto conditional
bool Property EorlundForceGreetInChamber auto conditional

Scene Property KodlaksFuneral auto
Quest Property FuneralObservers auto

Faction Property SafeCorpse auto
Faction Property Companions auto


Function Setup()
	parent.Setup()
	;WayBackQuest.SetStage(200)
	;BeforePreviousQuest.SetStage(200)
	;PreviousQuest.SetStage(200)
	Game.GetPlayer().AddItem(GlenmorilHead, 1)
	EssentialSkjor.Clear()
	EssentialKodlak.Clear()
	Skjor.GetActorReference().Kill()
	Kodlak.GetActorReference().Kill()
	Vilkas.GetReference().MoveTo(FuneralPoint2)
EndFunction

Function Init()
	Skyforge.GetReference().BlockActivation(true)
	parent.Init()
EndFunction

Function StartFuneral()
	FuneralObservers.Start()
	FuneralEnabler.Enable()
	KodlakBody.BlockActivation(true)
	Kodlak.GetReference().Disable()
	Aela.GetReference().MoveTo(FuneralPoint1)
	Farkas.GetReference().MoveTo(FuneralPoint3)
	Eorlund.GetReference().MoveTo(FuneralPoint4)

	Vilkas.GetActorReference().RemoveItem(VilkasHelmet)

	KodlaksFuneral.Start()
EndFunction

Function Teardown()
	parent.Teardown()
	Head1.Clear()
	Head2.Clear()
	Head3.Clear()
	Head4.Clear()
	Head5.Clear()
	EssentialEorlund.Clear()
	EssentialAela.Clear()
	EssentialVilkas.Clear()
	EssentialFarkas.Clear()
	C06PostQuest.Start()
	DeadThing1.Clear()
	DeadThing2.Clear()
	DeadThing3.Clear()
	DeadThing4.Clear()
	DeadThing5.Clear()
	DeadThing6.Clear()
	DeadThing7.Clear()
EndFunction

Event OnUpdate()
	; gotta wait to be done talking to Kodlak to cut him off
	if (KodlakOUT)
		ObjectReference gk = GhostKodlak.GetReference()
		GhostShader.Stop(gk)
		gk.Disable(true)
		SetStage(200)
	else
		RegisterForSingleUpdate(0.1)
	endif
EndEvent
