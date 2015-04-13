Scriptname DA03Script extends Quest  Conditional

int Property BarbasFollow  Auto  Conditional
{Should Barbas be following the player right now, or waiting near the next dungeon?
}

int Property VileOffer  Auto  Conditional
{The style of Vile's original offer, used in the DA03VileGreeting branch - 0 = how Barbas can earn his way back, 1 = wish to end the war, 2 = wish for power
}
