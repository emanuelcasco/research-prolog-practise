vivenEnDreadbury(agatha).
vivenEnDreadbury(elCarnicero).
vivenEnDreadbury(charles).

odia(charles, Alguien) :- 
  vivenEnDreadbury(Alguien), not(odia(agatha, Alguien)).
odia(agatha, Alguien) :- 
  vivenEnDreadbury(Alguien), Alguien \= elCarnicero.
odia(elCarnicero, Alguien) :- odia(agatha, Alguien).

esMasRico(Alguien, agatha) :- 
  vivenEnDreadbury(Alguien), not(odia(elCarnicero, Alguien)).

mato(Victimario, Victima) :- 
  odia(Victimario, Victima), 
  not(esMasRico(Victimario, Victima)), 
  vivenEnDreadbury(Victima).