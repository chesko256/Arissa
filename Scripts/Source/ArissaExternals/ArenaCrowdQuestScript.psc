Scriptname ArenaCrowdQuestScript extends Quest  

ReferenceAlias Property Spectator01 auto
ReferenceAlias Property Spectator02 auto
ReferenceAlias Property Spectator03 auto
ReferenceAlias Property Spectator04 auto
ReferenceAlias Property Spectator05 auto
ReferenceAlias Property Spectator06 auto
ReferenceAlias Property Spectator07 auto
ReferenceAlias Property Spectator08 auto
ReferenceAlias Property Spectator09 auto
ReferenceAlias Property Spectator10 auto

ReferenceAlias Property Spot01 auto
ReferenceAlias Property Spot02 auto
ReferenceAlias Property Spot03 auto
ReferenceAlias Property Spot04 auto
ReferenceAlias Property Spot05 auto
ReferenceAlias Property Spot06 auto
ReferenceAlias Property Spot07 auto
ReferenceAlias Property Spot08 auto
ReferenceAlias Property Spot09 auto
ReferenceAlias Property Spot10 auto



Function MoveEveryoneIntoPlace()
    Spectator01.GetReference().MoveTo(Spot01.GetReference())
    Spectator02.GetReference().MoveTo(Spot02.GetReference())
    Spectator03.GetReference().MoveTo(Spot03.GetReference())
    Spectator04.GetReference().MoveTo(Spot04.GetReference())
    Spectator05.GetReference().MoveTo(Spot05.GetReference())
    Spectator06.GetReference().MoveTo(Spot06.GetReference())
    Spectator07.GetReference().MoveTo(Spot07.GetReference())
    Spectator08.GetReference().MoveTo(Spot08.GetReference())
    Spectator09.GetReference().MoveTo(Spot09.GetReference())
    Spectator10.GetReference().MoveTo(Spot10.GetReference())
EndFunction
