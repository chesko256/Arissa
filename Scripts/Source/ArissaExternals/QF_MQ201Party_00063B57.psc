;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname QF_MQ201Party_00063B57 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PartyGuard1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PartyGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrthusEndario
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_OrthusEndario Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GeneralTullius
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GeneralTullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Razelan
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Razelan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PartyExitDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PartyExitDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Erikur
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Erikur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brelas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Brelas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VittoriaVici
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VittoriaVici Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Malborn
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Malborn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ProventusAvenicci
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ProventusAvenicci Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FriendDistraction
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FriendDistraction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maven
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Maven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PartyCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PartyCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlIgmund
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JarlIgmund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ondolemar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ondolemar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBalgruuf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JarlBalgruuf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PartyGuard2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PartyGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlElisif
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JarlElisif Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elenwen
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Elenwen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlIdgrod
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JarlIdgrod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlSiddgeir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JarlSiddgeir Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; Elenwen has spoken to player - Malborn interrupts
kmyQuest.MQ201.SetStage(108)
; register for updates
RegisterForSingleUpdate(kmyQuest.fRandomizeHelloTimer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; move Brelas to prison
Alias_Brelas.GetRef().Moveto(PrisonMarker)
Alias_Brelas.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; start Malborn intro scene when player comes inside
; trigger Malborn intro scene
MQ201PartyMalbornIntroScene.Start()
; trigger bard music
BardSongs.PlaySong(Alias_Bard.GetActorRef(),"Flute")
; Brelas hold tray
Alias_Brelas.GetActorRef().PlayIdle(IdleMQ201HoldingDrinkTray)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; Brelas is in trouble
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.PartyDistractionState = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; get rid of party guests and guards
; kill all running party scenes
ErikurIntroScene.Stop()
DistractionDrunkScene.Stop()
DistractionFriendScene.Stop()
DistractionErikurBrelasScene.Stop()
; disable guards
Alias_PartyGuard1.TryToDisable()
Alias_PartyGuard2.TryToDisable()
; move party NPCs back to editor locations
; normal guests
kmyQuest.MoveHome(Alias_Erikur)
kmyQuest.MoveHome(Alias_GeneralTullius)
kmyQuest.MoveHome(Alias_JarlElisif)
kmyQuest.MoveHome(Alias_Maven)
kmyQuest.MoveHome(Alias_Ondolemar)
kmyQuest.MoveHome(Alias_OrthusEndario)
kmyQuest.MoveHome(Alias_VittoriaVici)
; jarls
kmyQuest.MoveHome(Alias_JarlSiddgeir)
kmyQuest.MoveHome(Alias_JarlIgmund)
kmyQuest.MoveHome(Alias_JarlIdgrod)
kmyQuest.MoveHome(Alias_JarlBalgruuf)
kmyQuest.MoveHome(Alias_ProventusAvenicci)

; special handling
; Ondolemar hates you if you used him as the distraction
if (kmyQuest.MQ201 as MQ201QuestScript).OndolemarDistractionFlag
	Alias_Ondolemar.GetActorRef().SetRelationshipRank(Game.GetPlayer(),-2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player has agreed to help Erikur
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; this is where we move all the party guests to the party
ObjectReference partyMarker = Alias_PartyCenterMarker.GetRef()
; turn off Tullius CW objectives
kmyQuest.HideTulliusCWObjectives = true
; move NPCs
kmyQuest.MoveToParty(Alias_Erikur, partyMarker)
kmyQuest.MoveToParty(Alias_GeneralTullius, partyMarker)
kmyQuest.MoveToParty(Alias_JarlElisif, partyMarker)
kmyQuest.MoveToParty(Alias_JarlBalgruuf, partyMarker, true)
kmyQuest.MoveToParty(Alias_JarlIdgrod, partyMarker, true)
kmyQuest.MoveToParty(Alias_JarlIgmund, partyMarker, true)
kmyQuest.MoveToParty(Alias_JarlSiddgeir, partyMarker, true)
kmyQuest.MoveToParty(Alias_Maven, partyMarker)
kmyQuest.MoveToParty(Alias_Ondolemar, partyMarker)
kmyQuest.MoveToParty(Alias_OrthusEndario, partyMarker)
kmyQuest.MoveToParty(Alias_ProventusAvenicci, partyMarker)
kmyQuest.MoveToParty(Alias_VittoriaVici, partyMarker)
kmyQuest.MoveToParty(Alias_Bard, partyMarker)
; if no bard, create one
if Alias_Bard.GetRef() == None
	objectReference myBard = partyMarker.PlaceAtMe(MQ201Bard)
	Alias_Bard.ForceRefTo(myBard)
endif
; make "guest list"
kmyQuest.AddToGuestList(Alias_Erikur)
kmyQuest.AddToGuestList(Alias_GeneralTullius)
kmyQuest.AddToGuestList(Alias_JarlElisif)
kmyQuest.AddToGuestList(Alias_JarlBalgruuf)
kmyQuest.AddToGuestList(Alias_JarlIdgrod)
kmyQuest.AddToGuestList(Alias_JarlIgmund)
kmyQuest.AddToGuestList(Alias_JarlSiddgeir)
kmyQuest.AddToGuestList(Alias_Maven)
kmyQuest.AddToGuestList(Alias_Ondolemar)
kmyQuest.AddToGuestList(Alias_OrthusEndario)
kmyQuest.AddToGuestList(Alias_ProventusAvenicci)
kmyQuest.AddToGuestList(Alias_VittoriaVici)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; trigger Vittoria intro scene
VittoriaIntroScene.Start()
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.NoPartyConversationFlag = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; disable Brelas
Alias_Brelas.GetRef().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; trigger Erikur/Brelas intro scene
ErikurIntroScene.Start()
; turn off conversations
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.NoPartyConversationFlag = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; end Vittoria intro scene
kmyquest.OrthusIntroducedVittoria  = true
; allow conversations again
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.NoPartyConversationFlag = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player has talked to Brelas
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 25 - finish Erikur intro scene")
; finish Erikur intro scene
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.NoPartyConversationFlag = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; player has told Erikur about Brelas -- trigger distraction scene
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.StartDistractionScene(MQ201.PartyDistractionErikurBrelasScene)
; Erikur likes player better
Alias_Erikur.GetActorRef().ModFavorPoints(FavorRewardSmall.value as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; clean up party stuff
; turn on Tullius CW objectives
kmyQuest.HideTulliusCWObjectives = false
; move Illdi back if she was used here
if Alias_Bard.GetActorRef().GetActorBase() == Illdi
	kmyQuest.MoveHome(Alias_Bard)
else
	Alias_Bard.GetRef().Delete()
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE MQ201PartyScript
Quest __temp = self as Quest
MQ201PartyScript kmyQuest = __temp as MQ201PartyScript
;END AUTOCAST
;BEGIN CODE
; player lies to Erikur about Brelas
MQ201QuestScript MQ201 = kmyQuest.MQ201 as MQ201QuestScript
MQ201.PlayerLiesAboutBrelas = true
; Brelas likes player less
Alias_Brelas.GetActorRef().ModFavorPoints( -1* (FavorRewardSmall.value as int) )
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; can stop bard song now
BardSongs.StopAllSongs()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ErikurIntroScene  Auto  

ObjectReference Property PrisonMarker  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

Scene Property DistractionDrunkScene  Auto  

Scene Property DistractionFriendScene  Auto  

Scene Property DistractionErikurBrelasScene  Auto  

Scene Property MQ201PartyMalbornIntroScene  Auto  

ActorBase Property MQ201Bard  Auto  

ActorBase Property Illdi  Auto  

BardSongsScript Property BardSongs  Auto  

Scene Property VittoriaIntroScene  Auto  

Idle Property IdleMQ201HoldingDrinkTray  Auto  
