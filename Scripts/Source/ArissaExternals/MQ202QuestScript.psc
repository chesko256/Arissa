Scriptname MQ202QuestScript extends Quest  Conditional

event OnUpdate()
	if TG01.GetStage() >= 10 && GetStageDone(20) == 0
		SetStage(20)
	endif
endEvent

Quest Property TG01 auto
{watch for TG01 to reach stage 10 to update objective}



int Property VekelToldAboutThalmor = 0 Auto  Conditional
{set to 1 when Vekel mentions that others are looking for Esbern}

function CheckForGissurOverhearing( Actor pSpeaker = None )
	if GetStageDone(60) == 0 && GetStageDone(65) == 0
		Actor player = Game.GetPlayer()
		Actor gissur = Alias_Gissur.GetActorRef()
		if gissur && (gissur.hasLOS(player) && gissur.GetDistance(player) < 800) ||  player.IsDetectedBy(gissur)
			if pSpeaker && GetStageDone(55)
				Alias_FlagonBartender.ForceRefTo(pSpeaker)
			endif
			SetStage(60)
		endif
	endif
endFunction

ReferenceAlias Property Alias_Gissur  Auto  


ReferenceAlias Property Alias_FlagonBartender  Auto  
{put the last one (Vekel or Dirge) who told the player
about Esbern in this alias
Used by the Gissur scene}

FavorDialogueScript Property DialogueFavorGeneric  Auto  

ReferenceAlias Property Alias_Vekel  Auto  

ReferenceAlias Property Alias_Dirge  Auto  
