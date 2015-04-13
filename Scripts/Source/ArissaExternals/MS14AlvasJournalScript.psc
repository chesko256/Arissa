Scriptname MS14AlvasJournalScript extends ReferenceAlias  

Event OnLoad()

	Self.GetReference().SetNoFavorAllowed()

EndEvent



Event OnActivate(ObjectReference ActorRef)
    If ActorRef == Game.GetPlayer()
;        If GetOwningQuest().GetStage() == 90
            GetOwningQuest().SetStage(95)
;        EndIf
    EndIf
EndEvent