Scriptname PlayerWerewolfChangeScript extends Quest  

float Property StandardDurationSeconds auto
{How long (in real seconds) the transformation lasts}

float Property DurationWarningTimeSeconds auto
{How long (in real seconds) before turning back we should warn the player}

float Property FeedExtensionTimeSeconds auto
{How long (in real seconds) that feeding extends werewolf time}

VisualEffect property FeedBloodVFX auto
{Visual Effect on Wolf for Feeding Blood}

Race Property WerewolfBeastRace auto
ObjectReference Property LycanStash auto
Perk Property PlayerWerewolfFeed auto

Faction Property PlayerWerewolfFaction auto
Faction Property WerewolfFaction auto

Message Property PlayerWerewolfExpirationWarning auto
Message Property PlayerWerewolfFeedMessage auto
GlobalVariable Property GameDaysPassed auto
GlobalVariable Property TimeScale auto
GlobalVariable Property PlayerWerewolfShiftBackTime auto

ImageSpaceModifier Property WerewolfWarn auto
ImageSpaceModifier Property WerewolfChange auto

Race Property WerewolfRace auto
Sound Property NPCWerewolfTransformation auto
Sound Property WerewolfIMODSound auto
Idle Property WerewolfTransformBack auto
Idle Property SpecialFeeding auto

Quest Property CompanionsTrackingQuest auto
Quest Property C03Rampage auto

Shout Property CurrentHowl auto
WordOfPower Property CurrentHowlWord1 auto
WordOfPower Property CurrentHowlWord2 auto
WordOfPower Property CurrentHowlWord3 auto

Spell Property PlayerWerewolfLvl10AndBelowAbility auto
Spell Property PlayerWerewolfLvl15AndBelowAbility auto
Spell Property PlayerWerewolfLvl20AndBelowAbility auto
Spell Property PlayerWerewolfLvl25AndBelowAbility auto
Spell Property PlayerWerewolfLvl30AndBelowAbility auto
Spell Property PlayerWerewolfLvl35AndBelowAbility auto
Spell Property PlayerWerewolfLvl40AndBelowAbility auto
Spell Property PlayerWerewolfLvl45AndBelowAbility auto
Spell Property PlayerWerewolfLvl50AndOverAbility auto

Spell Property FeedBoost auto
Spell property BleedingFXSpell auto
{This Spell is for making the target of feeding bleed.}

Armor Property WolfSkinFXArmor auto

bool Property Untimed auto

FormList Property CrimeFactions auto
FormList Property WerewolfDispelList auto

float __durationWarningTime = -1.0
float __feedExtensionTime = -1.0
bool __tryingToShiftBack = false
bool __shiftingBack = false
bool __shuttingDown = false
bool __trackingStarted = false

float Function RealTimeSecondsToGameTimeDays(float realtime)
    float scaledSeconds = realtime * TimeScale.Value
    return scaledSeconds / (60 * 60 * 24)
EndFunction

float Function GameTimeDaysToRealTimeSeconds(float gametime)
    float gameSeconds = gametime * (60 * 60 * 24)
    return (gameSeconds / TimeScale.Value)
EndFunction

Function PrepShift()
;     Debug.Trace("WEREWOLF: Prepping shift...")
    Actor player = Game.GetPlayer()

    ; sets up the UI restrictions
    Game.SetBeastForm(True)
    Game.EnableFastTravel(False)

    ; set up perks/abilities
    ;  (don't need to do this anymore since it's on from gamestart)
    ; Game.GetPlayer().AddPerk(PlayerWerewolfFeed)

    ; screen effect
    WerewolfChange.Apply()
    WerewolfIMODSound.Play(Game.GetPlayer())

    ; get rid of your summons
    int count = 0
    while (count < WerewolfDispelList.GetSize())
        Spell gone = WerewolfDispelList.GetAt(count) as Spell
        if (gone != None)
            Game.GetPlayer().DispelSpell(gone)
        endif
        count += 1
    endwhile


    Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)
    Game.ForceThirdPerson()
    Game.ShowFirstPersonGeometry(false)
EndFunction

Function InitialShift()
;     Debug.Trace("WEREWOLF: Player beginning transformation.")

    WerewolfWarn.Apply()

    if (Game.GetPlayer().IsDead())
;         Debug.Trace("WEREWOLF: Player is dead; bailing out.")
        return
    endif

    ; actual switch
    Game.GetPlayer().SetRace(WerewolfBeastRace)
EndFunction

Function StartTracking()
    if (__trackingStarted)
        return
    endif

    __trackingStarted = true

;     Debug.Trace("WEREWOLF: Race swap done; starting tracking and effects.")
    
    ; take all the player's stuff (since he/she can't use it anyway)
    ; Game.GetPlayer().RemoveAllItems(LycanStash)
    Game.GetPlayer().UnequipAll()
    Game.GetPlayer().EquipItem(WolfSkinFXArmor, False, True)

    ;Add Blood Effects
    ;FeedBloodVFX.Play(Game.GetPlayer())

    ; make everyone hate you
    Game.GetPlayer().SetAttackActorOnSight(true)

    ; alert anyone nearby that they should now know the player is a werewolf
    Game.SendWereWolfTransformation()

    Game.GetPlayer().AddToFaction(PlayerWerewolfFaction)
    Game.GetPlayer().AddToFaction(WerewolfFaction)
    int cfIndex = 0
    while (cfIndex < CrimeFactions.GetSize())
;         Debug.Trace("WEREWOLF: Setting enemy flag on " + CrimeFactions.GetAt(cfIndex))
        (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy()
        cfIndex += 1
    endwhile

    ; but they also don't know that it's you
    Game.SetPlayerReportCrime(false)

    ; recalc times
    __durationWarningTime = RealTimeSecondsToGameTimeDays(DurationWarningTimeSeconds)
    __feedExtensionTime   = RealTimeSecondsToGameTimeDays(FeedExtensionTimeSeconds)

    ; unequip magic
    Spell left = Game.GetPlayer().GetEquippedSpell(0)
    Spell right = Game.GetPlayer().GetEquippedSpell(1)
    Spell power = Game.GetPlayer().GetEquippedSpell(2)
    Shout voice = Game.GetPlayer().GetEquippedShout()
    if (left != None)
        Game.GetPlayer().UnequipSpell(left, 0)
    endif
    if (right != None)
        Game.GetPlayer().UnequipSpell(right, 1)
    endif
    if (power != None)
        ; some players are overly clever and sneak a power equip between casting
        ;  beast form and when we rejigger them there. this will teach them.
;         Debug.Trace("WEREWOLF: " + power + " was equipped; removing.")
        Game.GetPlayer().UnequipSpell(power, 2)
    else
;         Debug.Trace("WEREWOLF: No power equipped.")
    endif
    if (voice != None)
        ; same deal here, but for shouts
;         Debug.Trace("WEREWOLF: " + voice + " was equipped; removing.")
        Game.GetPlayer().UnequipShout(voice)
    else
;         Debug.Trace("WEREWOLF: No shout equipped.")
    endif

    ; but make up for it by giving you the sweet howl
    CurrentHowlWord1 = (CompanionsTrackingQuest as CompanionsHousekeepingScript).CurrentHowlWord1
    CurrentHowlWord2 = (CompanionsTrackingQuest as CompanionsHousekeepingScript).CurrentHowlWord2
    CurrentHowlWord3 = (CompanionsTrackingQuest as CompanionsHousekeepingScript).CurrentHowlWord3
    CurrentHowl = (CompanionsTrackingQuest as CompanionsHousekeepingScript).CurrentHowl

    Game.UnlockWord(CurrentHowlWord1)
    Game.UnlockWord(CurrentHowlWord2)
    Game.UnlockWord(CurrentHowlWord3)
    Game.GetPlayer().AddShout(CurrentHowl)
    Game.GetPlayer().EquipShout(CurrentHowl)

    ; and some rad claws
    int playerLevel = Game.GetPlayer().GetLevel()
    if     (playerLevel <= 10)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl10AndBelowAbility, false)
    elseif (playerLevel <= 15)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl15AndBelowAbility, false)
    elseif (playerLevel <= 20)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl20AndBelowAbility, false)
    elseif (playerLevel <= 25)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl25AndBelowAbility, false)
    elseif (playerLevel <= 30)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl30AndBelowAbility, false)
    elseif (playerLevel <= 35)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl35AndBelowAbility, false)
    elseif (playerLevel <= 40)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl40AndBelowAbility, false)
    elseif (playerLevel <= 45)
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl45AndBelowAbility, false)
    else
        Game.GetPlayer().AddSpell(PlayerWerewolfLvl50AndOverAbility, false)
    endif

    ; calculate when the player turns back into a pumpkin
    float currentTime = GameDaysPassed.GetValue()
    float regressTime = currentTime + RealTimeSecondsToGameTimeDays(StandardDurationSeconds)
    PlayerWerewolfShiftBackTime.SetValue(regressTime)
;     Debug.Trace("WEREWOLF: Current day -- " + currentTime)
;     Debug.Trace("WEREWOLF: Player will turn back at day " + regressTime)

    ; increment stats
    Game.IncrementStat("Werewolf Transformations")

    ; set us up to check when we turn back
    RegisterForUpdate(5)

    SetStage(10) ; we're done with the transformation handling
EndFunction


Event OnUpdate()
    if (Untimed)
        return
    endif
    float currentTime = GameDaysPassed.GetValue()
    float regressTime = PlayerWerewolfShiftBackTime.GetValue()

    if (  (currentTime >= regressTime) && (!Game.GetPlayer().IsInKillMove()) && !__tryingToShiftBack )
        UnregisterForUpdate()
        SetStage(100) ; time to go, buddy
        return
    endif

    if (currentTime >= regressTime - __durationWarningTime)
        if (GetStage() == 10)
            SetStage(20)  ; almost there
            return
        endif
    endif

;     Debug.Trace("WEREWOLF: Checking, still have " + GameTimeDaysToRealTimeSeconds(regressTime - currentTime) + " seconds to go.")
EndEvent

Function SetUntimed(bool untimedValue)
    Untimed = untimedValue
    if (Untimed)
        UnregisterForUpdate()
    endif
EndFunction

; called from stage 11
Function Feed(Actor victim)
    float newShiftTime = PlayerWerewolfShiftBackTime.GetValue() + __feedExtensionTime
    Game.GetPlayer().PlayIdle(SpecialFeeding)
    
    ;This is for adding a spell that simulates bleeding
    BleedingFXSpell.Cast(victim,victim)
    
    if (!C03Rampage.IsRunning())
        PlayerWerewolfShiftBackTime.SetValue(newShiftTime)
        PlayerWerewolfFeedMessage.Show()
        FeedBoost.Cast(Game.GetPlayer())
        ; victim.SetActorValue("Variable08", 100)
;         Debug.Trace("WEREWOLF: Player feeding -- new regress day is " + newShiftTime)
    endif
    SetStage(10)
EndFunction


; called from stage 20
Function WarnPlayer()
;     Debug.Trace("WEREWOLF: Player about to transform back.")
    WerewolfWarn.Apply()
EndFunction


; called from stage 100
Function ShiftBack()
    __tryingToShiftBack = true

    while (Game.GetPlayer().GetAnimationVariableBool("bIsSynced"))
;         Debug.Trace("WEREWOLF: Waiting for synced animation to finish...")
        Utility.Wait(0.1)
    endwhile
;     Debug.Trace("WEREWOLF: Sending transform event to turn player back to normal.")

    __shiftingBack = false
    ; RegisterForAnimationEvent(Game.GetPlayer(), "TransformToHuman")
    ; Game.GetPlayer().PlayIdle(WerewolfTransformBack)
    ; Utility.Wait(10)
    ActuallyShiftBackIfNecessary()
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "TransformToHuman")
        ActuallyShiftBackIfNecessary()
    endif
EndEvent

Function ActuallyShiftBackIfNecessary()
    if (__shiftingBack)
        return
    endif

    __shiftingBack = true

;     Debug.Trace("WEREWOLF: Player returning to normal.")

    Game.SetInCharGen(true, true, false)

    UnRegisterForAnimationEvent(Game.GetPlayer(), "TransformToHuman")
    UnRegisterForUpdate() ; just in case

    if (Game.GetPlayer().IsDead())
;         Debug.Trace("WEREWOLF: Player is dead; bailing out.")
        return
    endif

    ;Remove Blood Effects
    ;FeedBloodVFX.Stop(Game.GetPlayer())

    ; imod
    WerewolfChange.Apply()
    WerewolfIMODSound.Play(Game.GetPlayer())

    ; get rid of your summons if you have any
    int count = 0
    while (count < WerewolfDispelList.GetSize())
        Spell gone = WerewolfDispelList.GetAt(count) as Spell
        if (gone != None)
;             Debug.Trace("WEREWOLF: Dispelling " + gone)
            Game.GetPlayer().DispelSpell(gone)
        endif
        count += 1
    endwhile

    ; make sure the transition armor is gone
    Game.GetPlayer().UnequipItem(WolfSkinFXArmor, False, True)

    ; clear out perks/abilities
    ;  (don't need to do this anymore since it's on from gamestart)
    ; Game.GetPlayer().RemovePerk(PlayerWerewolfFeed)

    ; make sure your health is reasonable before turning you back
    ; Game.GetPlayer().GetActorBase().SetInvulnerable(true)
    Game.GetPlayer().SetGhost()
    float currHealth = Game.GetPlayer().GetAV("health")
    if (currHealth <= 70)
;         Debug.Trace("WEREWOLF: Player's health is only " + currHealth + "; restoring.")
        Game.GetPlayer().RestoreAV("health", 70 - currHealth)
    endif

    ; change you back
;     Debug.Trace("WEREWOLF: Setting race " + (CompanionsTrackingQuest as CompanionsHousekeepingScript).PlayerOriginalRace + " on " + Game.GetPlayer())
    Game.GetPlayer().SetRace((CompanionsTrackingQuest as CompanionsHousekeepingScript).PlayerOriginalRace)

    ; release the player controls
;     Debug.Trace("WEREWOLF: Restoring camera controls")
    Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abLooking = false, abSneaking = false, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)
    Game.ShowFirstPersonGeometry(true)

    ; no more howling for you
    Game.GetPlayer().UnequipShout(CurrentHowl)
    Game.GetPlayer().RemoveShout(CurrentHowl)

    ; or those claws
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl10AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl15AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl20AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl25AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl30AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl35AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl40AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl45AndBelowAbility)
    Game.GetPlayer().RemoveSpell(PlayerWerewolfLvl50AndOverAbility)

    ; gimme back mah stuff
    ; LycanStash.RemoveAllItems(Game.GetPlayer())

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

    ; alert anyone nearby that they should now know the player is a werewolf
    Game.SendWereWolfTransformation()

    ; give the set race event a chance to come back, otherwise shut us down
    Utility.Wait(5)
    Shutdown()
EndFunction

Function Shutdown()
    if (__shuttingDown)
        return
    endif

    __shuttingDown = true

    Game.GetPlayer().GetActorBase().SetInvulnerable(false)
    Game.GetPlayer().SetGhost(false)

    Game.SetBeastForm(False)
    Game.EnableFastTravel(True)

    Game.SetInCharGen(false, false, false)

    Stop()
EndFunction
