hijo(lisa,marge).
hijo(maggie,marge).
hijo(bart,marge).
hijo(lisa,homero).
hijo(maggie,homero).
hijo(bart,homero).
hijo(homero,abe).
hijo(herbert,abe).
hijo(marge,madredemarge).
hijo(nelson,madredenelson).	

hijo(tod,flanders).
hijo(rod,flanders).

esPadre(Alguien) :- hijo(_,Alguien).

hermano(H1, H2) :-
  hijo(H1, Padre),
  hijo(H2, Padre),
  H1 \= H2.

tio(Alguien, Sobrino) :-
  hijo(Sobrino, Padre),
  hermano(Alguien, Padre).
  
pareja(marge,homero).


padre(homero, bart).
padre(abraham, homero).

descendiente(Descendiente, Ancestro) :- padre(Ancestro, Descendiente). 

descendiente(Descendiente, Ancestro) :-
  padre(Padre, Descendiente),
  descendiente(Padre, Ancestro).