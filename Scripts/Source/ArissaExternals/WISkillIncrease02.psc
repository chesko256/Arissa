Scriptname WISkillIncrease02 extends Quest  

Event OnStoryIncreaseSkill (string asSkill)
	; === Alteration ===
	If Game.GetPlayer().GetAV("Alteration") >= PCSkillMaster.GetValue()
		PCAlterationMaster.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Alteration") >= PCSkillExpert.GetValue()
		PCAlterationExpert.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Alteration") >= PCSkillAdept.GetValue()
		PCAlterationAdept.SetValue(0)
	EndIf

	; === Conjuration ===
	If Game.GetPlayer().GetAV("Conjuration") >= PCSkillMaster.GetValue()
		PCConjurationMaster.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Conjuration") >= PCSkillExpert.GetValue()
		PCConjurationExpert.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Conjuration") >= PCSkillAdept.GetValue()
		PCConjurationAdept.SetValue(0)
	EndIf

	; === Destruction ===
	If Game.GetPlayer().GetAV("Destruction") >= PCSkillMaster.GetValue()
		PCDestructionMaster.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Destruction") >= PCSkillExpert.GetValue()
		PCDestructionExpert.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Destruction") >= PCSkillAdept.GetValue()
		PCDestructionAdept.SetValue(0)
	EndIf

	; === Illusion ===
	If Game.GetPlayer().GetAV("Illusion") >= PCSkillMaster.GetValue()
		PCIllusionMaster.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Illusion") >= PCSkillExpert.GetValue()
		PCIllusionExpert.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Illusion") >= PCSkillAdept.GetValue()
		PCIllusionAdept.SetValue(0)
	EndIf

	; === Restoration ===
	If Game.GetPlayer().GetAV("Restoration") >= PCSkillMaster.GetValue()
		PCRestorationMaster.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Restoration") >= PCSkillExpert.GetValue()
		PCRestorationExpert.SetValue(0)
	EndIf
	If Game.GetPlayer().GetAV("Restoration") >= PCSkillAdept.GetValue()
		PCRestorationAdept.SetValue(0)
	EndIf

	Stop()
EndEvent

GlobalVariable Property PCSkillAdept  Auto  
GlobalVariable Property PCSkillExpert  Auto  
GlobalVariable Property PCSkillMaster  Auto  

GlobalVariable Property PCAlterationAdept  Auto  
GlobalVariable Property PCAlterationExpert  Auto  
GlobalVariable Property PCAlterationMaster  Auto  

GlobalVariable Property PCConjurationAdept  Auto  
GlobalVariable Property PCConjurationExpert  Auto  
GlobalVariable Property PCConjurationMaster  Auto  

GlobalVariable Property PCDestructionAdept  Auto  
GlobalVariable Property PCDestructionExpert  Auto  
GlobalVariable Property PCDestructionMaster  Auto  

GlobalVariable Property PCIllusionAdept  Auto  
GlobalVariable Property PCIllusionExpert  Auto  
GlobalVariable Property PCIllusionMaster  Auto  

GlobalVariable Property PCRestorationAdept  Auto  
GlobalVariable Property PCRestorationExpert  Auto  
GlobalVariable Property PCRestorationMaster  Auto  


