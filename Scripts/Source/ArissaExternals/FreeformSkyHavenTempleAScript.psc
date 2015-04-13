ScriptName FreeformSkyHavenTempleAScript extends Quest Conditional

Int Property BladesCount Auto Conditional
ReferenceAlias Property Blade01 Auto 
ReferenceAlias Property Blade02 Auto 
ReferenceAlias Property Blade03 Auto 
Outfit Property ArmorBladesOutfit Auto
Faction Property PotentialFollowerFaction Auto
Faction Property BladesFaction Auto
Weapon Property AkaviriKatana Auto
LeveledItem Property LItemBanditWeaponMissile Auto

DialogueFollowerScript Property DialogueFollower Auto

Function RecruitBlade (Actor RecruitREF)

	;Follower becomes a Blade
	;Incremement counter
	If (BladesCount == 0)
		Blade01.ForceRefTo(RecruitREF)
		DialogueFollower.DismissFollower(0, 0)
		BladesCount = 1
		SetStage(20)
	ElseIf (BladesCount == 1)
		Blade02.ForceRefTo(RecruitREF)
		DialogueFollower.DismissFollower(0, 0)
		BladesCount = 2
		SetStage(30)
	ElseIf (BladesCount == 2)
		Blade03.ForceRefTo(RecruitREF)
		DialogueFollower.DismissFollower(0, 0)
		BladesCount = 3
		SetStage(40)
	EndIf

EndFunction

Function EquipBlade (Actor RecruitREF)

	;Recruit becomes a Blade and gets Blade equipment
	RecruitREF.AddtoFaction(BladesFaction)
	RecruitREF.SetOutfit(ArmorBladesOutfit)
	RecruitREF.AddItem(AkaviriKatana)
	RecruitREF.EquipItem(AkaviriKatana)
	RecruitREF.AddItem(LItemBanditWeaponMissile)

EndFunction