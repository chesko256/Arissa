Scriptname C03RampageQuest extends Quest  

ObjectReference Property RampageStartMarker auto

Faction Property PlayerWerewolfFaction auto
Faction Property WerewolfFaction auto
FormList Property CrimeFactions auto
ObjectReference Property LycanStash auto
Race Property WerewolfRace auto
Race Property NordRace auto

VisualEffect property FeedBloodVFX auto

ReferenceAlias Property Aela auto ; on C03
ObjectReference Property AelaLycanStash auto
Outfit Property AelaOutfit auto

; so we can hustle them inside when needed
ReferenceAlias Property Kodlak auto
ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto
ReferenceAlias Property Athis auto
ReferenceAlias Property Njada auto
ReferenceAlias Property Ria auto
ReferenceAlias Property Torvar auto

float Property RampageMinutesGameTime auto
float Property FadeSeconds auto

Idle Property BleedOutIdle auto

Scene Property PostRampageScene auto

Spell Property Immunity auto
Spell Property WerewolfCureDisease auto
Quest Property PlayerVampireQuest auto
Quest Property PlayerWerewolfCureQuest auto
Keyword Property VampireKeyword auto

ImageSpaceModifier Property WerewolfChange auto
ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property HoldBlack auto
ImageSpaceModifier Property FadeFromBlack auto
Shout Property CurrentHowl auto
WordOfPower Property CurrentHowlWord1 auto
WordOfPower Property CurrentHowlWord2 auto
WordOfPower Property CurrentHowlWord3 auto
Spell Property FeedBoost auto
Spell Property BeastForm auto
Idle Property SpecialFeeding auto

MusicType Property CombatMusic auto

bool __turningBack = false
Race __originalRace = None

;; Based on the code from PlayerWerewolfChangeScript
Function StartRampage()
;     Debug.Trace("C03: Rampage start.")

    ; black you out
    FadeToBlack.Apply()
    Utility.Wait(FadeSeconds)
    FadeToBlack.PopTo(HoldBlack)

    ; usually done by the spell effect
    Game.ForceThirdPerson()
    Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)
    Game.ShowFirstPersonGeometry(false)

    ; throw you outside
    Game.GetPlayer().MoveTo(RampageStartMarker)

    ; disable fast travel
    Game.EnableFastTravel(false)

    ; throw everyone else inside
    Kodlak.GetReference().MoveToMyEditorLocation()
    Aela.GetReference().MoveToMyEditorLocation()
    Farkas.GetReference().MoveToMyEditorLocation()
    Vilkas.GetReference().MoveToMyEditorLocation()
    Athis.GetReference().MoveToMyEditorLocation()
    Njada.GetReference().MoveToMyEditorLocation()
    Ria.GetReference().MoveToMyEditorLocation()
    Torvar.GetReference().MoveToMyEditorLocation()
    
    ; make you immune to disease, remove existing diseases
    if (Game.GetPlayer().HasKeyword(VampireKeyword))
        (PlayerVampireQuest as PlayerVampireQuestScript).VampireCure(Game.GetPlayer())
    endif
    WerewolfCureDisease.Cast(Game.GetPlayer())
    Game.GetPlayer().AddSpell(Immunity, false)

    ; start the cure quest (though it won't actually matter until later)
    PlayerWerewolfCureQuest.Start()

    ; usually done responding to animation event
;     Debug.Trace("C03 Rampage: Current player race is " + Game.GetPlayer().GetRace())
    __originalRace = Game.GetPlayer().GetRace()
;     Debug.Trace("C03 Rampage: Setting race " + WerewolfRace + " on " + Game.GetPlayer())
    Game.GetPlayer().SetRace(WerewolfRace) ;TEEN WOLF

    ; Attach Blood Effects for feeding.
    FeedBloodVFX.Play(Game.GetPlayer(),-1)  

    ; put Aela back to normal
;     Debug.Trace("C03 Rampage: Setting race " + NordRace + " on " + Aela.GetActorReference())
    Aela.GetActorReference().SetRace(NordRace)
    AelaLycanStash.RemoveAllItems(Aela.GetActorReference())
    Aela.GetActorReference().SetOutfit(AelaOutfit)

    ; give you the spell
    Game.GetPlayer().AddSpell(BeastForm)
    BeastForm.Cast(Game.GetPlayer())

    ; make everyone hate you
    Game.GetPlayer().SetAttackActorOnSight(true)
    Game.GetPlayer().AddToFaction(PlayerWerewolfFaction)
    Game.GetPlayer().AddToFaction(WerewolfFaction)
    int cfIndex = 0
    while (cfIndex < CrimeFactions.GetSize())
;         Debug.Trace("C03: Setting enemy flag on " + CrimeFactions.GetAt(cfIndex))
        (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy()
        cfIndex += 1
    endwhile

    ; but they also don't know that it's you
    Game.SetPlayerReportCrime(false)

    ; sets up the UI restrictions
    Game.SetBeastForm(True)

    ; take all the player's stuff (since he/she can't use it anyway)
    ; Game.GetPlayer().RemoveAllItems(LycanStash)
    Game.GetPlayer().UnequipAll()

    ; unequip magic
    Spell left = Game.GetPlayer().GetEquippedSpell(0)
    Spell right = Game.GetPlayer().GetEquippedSpell(1)
    if (left != None)
        Game.GetPlayer().UnequipSpell(left, 0)
    endif
    if (right != None)
        Game.GetPlayer().UnequipSpell(right, 1)
    endif

    ; but make up for it by giving you the sweet howl
    Game.UnlockWord(CurrentHowlWord1)
    Game.UnlockWord(CurrentHowlWord2)
    Game.UnlockWord(CurrentHowlWord3)
    Game.GetPlayer().AddShout(CurrentHowl)
    Game.GetPlayer().EquipShout(CurrentHowl)

    RegisterForSingleUpdateGameTime(RampageMinutesGameTime / 60.0)

    HoldBlack.PopTo(FadeFromBlack)
    HoldBlack.Remove()
    CombatMusic.Add()
    Utility.Wait(3)
    FadeFromBlack.Remove()
EndFunction

Event OnUpdateGameTime()
	TurnBack()
EndEvent

Function TurnBack()
	if (__turningBack)
		return
	endif

	__turningBack = true

	UnregisterForUpdateGameTime() ; in case we were called directly

    while (Game.GetPlayer().GetAnimationVariableBool("bIsSynced"))
;         Debug.Trace("WEREWOLF: Waiting for synced animation to finish...")
        Utility.Wait(0.1)
    endwhile
    
;     Debug.Trace("C03: Player returning to normal.")

    ; Game.GetPlayer().GetActorBase().SetInvulnerable(true)
    Game.GetPlayer().SetGhost()

    ;Remove Blood Effects
    FeedBloodVFX.Stop(Game.GetPlayer())

    ; do the light show
    WerewolfChange.Apply()
    FadeToBlack.Apply()
    Utility.Wait(FadeSeconds)
    FadeToBlack.PopTo(HoldBlack)

    ; restore the interface
    Game.SetBeastForm(False)

    ; release the player controls
    Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abLooking = false, abSneaking = false, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)
    Game.ShowFirstPersonGeometry(true)

    ; no more howling for you
    Game.GetPlayer().UnequipShout(CurrentHowl)
    Game.GetPlayer().RemoveShout(CurrentHowl)

    ; people don't hate you no more
    Game.GetPlayer().SetAttackActorOnSight(false)
    Game.GetPlayer().RemoveFromFaction(PlayerWerewolfFaction)
    Game.GetPlayer().RemoveFromFaction(WerewolfFaction)
    int cfIndex = 0
    while (cfIndex < CrimeFactions.GetSize())
;         Debug.Trace("WEREWOLF: Removing enemy flag from " + CrimeFactions.GetAt(cfIndex))
        (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
        cfIndex += 1
    endwhile
    
    ; and you're now recognized
    Game.SetPlayerReportCrime(true)

    ; give you fast trave back
    Game.EnableFastTravel(true)

    Game.GetPlayer().ResetHealthAndLimbs()

    CombatMusic.Remove()

    PostRampageScene.Start()
EndFunction

Function RestorePlayerRace()
;     Debug.Trace("C03 Rampage: Setting race " + __originalRace + " on " + Game.GetPlayer())
	Game.GetPlayer().SetRace(__originalRace)
	__originalRace = None
EndFunction

Function Feed(Actor victim)
    Game.GetPlayer().PlayIdle(SpecialFeeding)
    FeedBoost.Cast(Game.GetPlayer())
    victim.SetActorValue("Variable08", 100)
EndFunction