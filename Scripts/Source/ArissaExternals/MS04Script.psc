Scriptname MS04Script extends Quest  conditional


int Property FDFFollow  Auto  Conditional
{Is FDF Following the player: 0 = no, 1= yes}

ObjectReference Property MS04AvanchnzelMarker   Auto  


Event OnUpdate()

	if GetStage() == 100
		if Game.GetPlayer().getDistance(MS04AvanchnzelMarker) < 5000
			setStage(110)
		endif
	endif

	if GetStage() == 110
		if Game.GetPlayer().getDistance(MS04AvanchnzelMarker) < 1000
			setStage(120)
		endif
	endif

EndEvent


;function processDude(int myInt)
;
;if myInt == 1
;FadeInGhost(alias_dude, aliasMarker1)
;...
;elseif int == 2
;fadeinghost(alias_dude, aliasMarker2)
;
;endfunction
;


Function FadeInGhost(ReferenceAlias GhostAlias, ReferenceAlias TargetMarkerAlias)

Actor GhostActor = GhostAlias.GetActorReference()

ObjectReference TargetMarkerRef = TargetMarkerAlias.GetRef()

; Debug.Trace(self + "FadeInGhost() is processing " + GhostAlias)

GhostActor.moveto(TargetMarkerRef)

EndFunction


