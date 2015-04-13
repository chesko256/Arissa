Scriptname OghmaInfiniumScript extends ObjectReference  

Quest Property DA04 auto
Message Property ChoiceMessage auto
int Property Advancement auto
bool Property HasBeenRead auto
Book Property MySelf auto

Function ReadOghmaInfinium(bool fromWorld)
	if (HasBeenRead || !DA04.GetStageDone(200)) || ((Game.GetFormFromFile(0x010009DE, "Update.esm") as GlobalVariable).GetValue() >= 1)
		return
	endif

	int choice = ChoiceMessage.Show()
	if     (choice == 0)
		; do nothing
	elseif (choice == 1)
		; path of might
; 		Debug.Trace("DA04: Player chose path of might.")
		Game.IncrementSkillBy("Smithing", Advancement)
		Game.IncrementSkillBy("HeavyArmor", Advancement)
		Game.IncrementSkillBy("Block", Advancement)
		Game.IncrementSkillBy("TwoHanded", Advancement)
		Game.IncrementSkillBy("OneHanded", Advancement)
		Game.IncrementSkillBy("Marksman", Advancement)
	elseif (choice == 2)
		; path of shadow
; 		Debug.Trace("DA04: Player chose path of shadow.")
		Game.IncrementSkillBy("LightArmor", Advancement)
		Game.IncrementSkillBy("Sneak", Advancement)
		Game.IncrementSkillBy("Lockpicking", Advancement)
		Game.IncrementSkillBy("Pickpocket", Advancement)
		Game.IncrementSkillBy("Speechcraft", Advancement)
		Game.IncrementSkillBy("Alchemy", Advancement)
	elseif (choice == 3)
		; path of magic
; 		Debug.Trace("DA04: Player chose path of magic.")
		Game.IncrementSkillBy("Illusion", Advancement)
		Game.IncrementSkillBy("Conjuration", Advancement)
		Game.IncrementSkillBy("Destruction", Advancement)
		Game.IncrementSkillBy("Restoration", Advancement)
		Game.IncrementSkillBy("Alteration", Advancement)
		Game.IncrementSkillBy("Enchanting", Advancement)
	else
		; WTF
	endif

	if (choice != 0)
		HasBeenRead = True
		(Game.GetFormFromFile(0x010009DE, "Update.esm") as GlobalVariable).SetValue(1)
		Utility.Wait(0.1)
		int oghmasInfinium = Game.GetPlayer().GetItemCount(MySelf)
		Game.GetPlayer().RemoveItem(MySelf, oghmasInfinium)
		if (fromWorld && oghmasInfinium == 0) ; this trusts that the book hasn't been duped somehow
			Delete()
		endif
		utility.WaitMenuMode(0)
	endif
EndFunction

Event OnEquipped(Actor reader)
	if (reader != Game.GetPlayer())
		return
	endif

; 	Debug.Trace("DA04: Player reading Oghma Infinium from inventory.")
	Utility.WaitMenuMode(2.0)
	ReadOghmaInfinium(false)
EndEvent

Event OnActivate(ObjectReference reader)
	if (reader != Game.GetPlayer() || IsActivationBlocked())
		return
	endif

; 	Debug.Trace("DA04: Player reading Oghma Infinium from world.")
	Utility.WaitMenuMode(2.0)
	ReadOghmaInfinium(true)
EndEvent
