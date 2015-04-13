ScriptName dunArcherQuestScript extends Quest Conditional

;Variable to track when player is in shooting box
Int Property playerInBox auto conditional

;Variable to drive the angiFeeback scene
Int Property feedbackFlag auto conditional
{0=no problems, 1=player not in box, 2=player use wrong arrow, 3=player not in box and wrong arrow, 4=wrong target}

;Variable to track if player has completed first challenge
Int Property playerChallengeComplete01 auto conditional

;Variable to track if player is using the correct ammo type
Int Property playerUsingPracticeArrow auto conditional

;Variable to track if player has hit the middle target
Int Property playerHitTargetMiddle auto conditional

;Variable to track if player has hit the left target
Int Property playerHitTargetLeft auto conditional

;Variable to track if player has hit the right target
Int Property playerHitTargetRight auto conditional

;Variable to track if player has hit the far target
Int Property playerHitTargetFar auto conditional

;Practice Arrows
Ammo property myAmmo auto

Scene property angiShootsFirstTime auto
Scene property angiShootsSecondTime auto
Scene property angiShootsThirdTime auto
Scene property angiShootsFinalTime auto
Scene property playerHitMidTarget auto
Scene property playerShootsThreeTargets auto
Scene property playerShootsFarTarget auto
Scene property playerShootsAllTargets auto

Weapon property angisBow auto
Int property FamilyStory auto conditional
Int property PlayerTookBow auto conditional

Int property count = 0 auto hidden
