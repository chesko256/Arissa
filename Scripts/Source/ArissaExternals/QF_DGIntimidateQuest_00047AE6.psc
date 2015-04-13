;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_DGIntimidateQuest_00047AE6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY opponent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_opponent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpponentFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpponentFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CR04Opponent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CR04Opponent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DGIntimidateQuestScript
Quest __temp = self as Quest
DGIntimidateQuestScript kmyQuest = __temp as DGIntimidateQuestScript
;END AUTOCAST
;BEGIN CODE
;forcegreet is done
Alias_Opponent.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; opponent is down, cue victory dialogue
Actor myOpponent = Alias_Opponent.GetActorRef()
myOpponent.AllowBleedoutDialogue(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; if the player hasn't cheated, stop combat
; debug.Trace(self + "Stopping Brawl combat alarm")
Game.GetPlayer().StopCombatAlarm()

;make sure player's hired hands don't aggro
Alias_Opponent.GetActorRef().StopCombatAlarm()
If Alias_OpponentFriend.GetActorRef() != None
  Alias_OpponentFriend.GetActorRef().StopCombatAlarm()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player loses
; debug.trace(self + " stage 180")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;empty
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;victory
Game.IncrementStat( "Brawls Won" )
; debug.trace(self + " stage 100")
DialogueFavorGeneric.Intimidate(Alias_Opponent.GetActorRef())

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player hits the NPC with a weapon or magic
; debug.trace(self + " stage 150")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DGIntimidateQuestScript
Quest __temp = self as Quest
DGIntimidateQuestScript kmyQuest = __temp as DGIntimidateQuestScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 200")
;always clear CR04 alias
Alias_CR04Opponent.Clear()

Actor OpponentREF = Alias_Opponent.GetActorRef()
Actor OpponentFriendREF = Alias_OpponentFriend.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

OpponentREF.AllowBleedoutDialogue(False)
OpponentREF.SetAv("Confidence", kmyquest.OpponentCon)
OpponentREF.UnregisterForUpdate()

if OpponentFriendREF
	OpponentFriendREF.UnregisterForUpdate()
endif

; if player lost, restore health to above 0
if GetStageDone(180) && PlayerREF.IsBleedingOut()
	; restore player's health to above 0
	float playerHealth = PlayerREF.GetActorValue("health")
	if playerHealth < 1
		playerHealth = math.abs(playerHealth) + 10
; 		debug.trace(self + " restoring " + playerHealth + " health to player")
		PlayerREF.RestoreActorValue("health", playerHealth)
	endif
endif

; if opponent is down, restore health to above 0
if OpponentREF.IsBleedingOut()
	; restore health to above 0
	float opponentHealth = OpponentREF.GetActorValue("health")
	if opponentHealth < 1
		opponentHealth = math.abs(opponentHealth) + 10
; 		debug.trace(self + " restoring " + opponentHealth + " health to opponent")
		OpponentREF.RestoreActorValue("health", opponentHealth)
	endif
endif

; if opponentfriend is down, restore health to above 0
if OpponentFriendREF
	If OpponentFriendREF.IsBleedingOut()
		; restore health to above 0
		float opponentFriendHealth = OpponentFriendREF.GetActorValue("health")
		if opponentFriendHealth < 1
			opponentFriendHealth =  math.abs(opponentFriendHealth) + 10
; 			debug.trace(self + " restoring " + opponentFriendHealth + " health to opponent's friend")
			OpponentREF.RestoreActorValue("health", opponentFriendHealth)
		endif
	EndIf
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player chooses to execute opponent
; debug.trace(self + " stage 160")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DGIntimidateQuestScript
Quest __temp = self as Quest
DGIntimidateQuestScript kmyQuest = __temp as DGIntimidateQuestScript
;END AUTOCAST
;BEGIN CODE
; fill the alias if this is CR04 and don't end quest if player fights dirty
Actor OpponentREF = Alias_Opponent.GetActorRef()
Actor FriendREF =  Alias_OpponentFriend.GetActorRef()
Actor cr04opp = CR04Opponent_Remote.GetActorReference()

if (cr04opp == OpponentREF)
; 	debug.trace(self + "Forcing CR04 ref")
	Alias_CR04Opponent.ForceRefTo(cr04opp)
	kmyquest.CR04Running = 1
	SetStage(5)
Else
	kmyquest.CR04Running = 0
; 	debug.trace(self + "NOT forcing CR04 ref")
endif


;make sure the opponent doesn't run
kmyquest.OpponentCon = OpponentREF.GetAV("Confidence") as int
OpponentREF.SetAv("Confidence", 4)
; debug.trace(self + " stage 10")

;remove player's weapons
Game.GetPlayer().EquipItem(Unarmed, abSilent=True)
OpponentREF.EquipItem(Unarmed, abSilent=True)

OpponentREF.StartCombat(Game.GetPlayer())
; if friend exists, start combat as well
if FriendREF
	FriendREF.EquipItem(Unarmed, abSilent=True)
	FriendREF.StartCombat(Game.GetPlayer())
endif

;start crowd quest
;kmyquest.WICrowdStart.SendStoryEvent(akRef1 = Game.GetPlayer(), akRef2 = OpponentREF)
;utility.Wait(5)
OpponentREF.RegisterForUpdate(5)
if FriendREF 
	FriendREF.RegisterForUpdate(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property IntimidateFaction  Auto  
{special combat faction}

Quest Property DialogueGeneric  Auto  

Scene Property FightScene  Auto  

ReferenceAlias Property CR04Opponent_Remote  Auto  

Weapon Property Unarmed  Auto  

Keyword Property WeapTypeBow  Auto  

Keyword Property WeapTypeGreatsword  Auto  

Keyword Property WeapTypeWarhammer  Auto  

Keyword Property WeapTypeBattleaxe  Auto  

FavorDialogueScript Property DialogueFavorGeneric  Auto  

Faction Property DGintimidateFaction  Auto  
