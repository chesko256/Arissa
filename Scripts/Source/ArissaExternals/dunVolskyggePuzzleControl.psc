scriptName dunVolskyggePuzzleControl extends ObjectReference

{
-This script checks to see if puzzle has been solved and then opens portcullis
}

import debug
import utility

bool property puzzleSolved auto hidden
int property numPuzzleHoldersSolved auto hidden
int property puzzleHolderCount auto
{Number of Puzzle Holders}

ObjectReference property puzzleDoorActivator auto
{The Parent Activator Dummy Ref for Door}

ObjectReference property refActOnSuccess01 auto
{This ref is activated when puzzle is solved}
