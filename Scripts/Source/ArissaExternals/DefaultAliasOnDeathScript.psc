Scriptname DefaultAliasOnDeathScript extends ReferenceAlias  
{Sets a stage on the parent quest when the alias dies}




int Property StageToSetOnDeath Auto
{What stage should be set when the alias dies?}

int property PrerequisiteStage = -1 auto
{What stage must be active to set the stage
	-1 == do not use and is the default}

event onDeath (actor akKiller)
	if PrerequisiteStage == -1
		getOwningQuest().setStage(StageToSetOnDeath)
	elseif getOwningQuest().getStage() == PrerequisiteStage
		getOwningQuest().setStage(StageToSetOnDeath)
	else	
; 		debug.Trace(self + " did not set stage " + StageToSetOnDeath + " because prerequisite stage was not set")
	endif
endEvent