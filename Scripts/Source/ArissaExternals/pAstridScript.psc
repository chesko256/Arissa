Scriptname pAstridScript extends ReferenceAlias Conditional 

 

Quest Property pDB02  Auto 
Quest Property DarkBrotherhoodQuest  Auto  
Quest Property DBDestroyQuest  Auto 

Event OnDeath(Actor aThisGuyKilledMe)



if PDB02.GetStage () < 200
	pDB02.SetStage (220)
endif	 


DBDestroyQuest.SetStage (10)
  


EndEvent



