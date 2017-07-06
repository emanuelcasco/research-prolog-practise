superheroe(batman).
superheroe(superman).
superheroe(ironman).
superheroe(hulk).
superheroe(spiderman).
superheroe(linternaVerde).
superheroe(flash).
superheroe(quicksilver).
superheroe(arrow).

fuenteDePoder(batman, millonario(2000000)).
fuenteDePoder(ironman, millonario(1000000)).
fuenteDePoder(arrow, millonario(999999)).
fuenteDePoder(hulk, radioactivo(gamma, 300)).
fuenteDePoder(spiderman, radioactivo(alpha, 300)).
fuenteDePoder(flash, velocista(300001)).
fuenteDePoder(quicksilver, velocista(250000)).
fuenteDePoder(linternaVerde, artefacto(anillo)).
fuenteDePoder(superman, multipoder([volar, rayosX, superFuerza, superVelocidad])).

% Es canchero -> millonario(>1000000); radioactivo(alpha,_); velocista(>250000); multipoder(puedevolar o tiene 10 poderes)

% esCanchero(Superheroe) :- [REPITO LOGICA!]
%   fuenteDePoder(Superheroe, millonario(Plata)), Plata >= 1000000.
% esCanchero(Superheroe) :-
%   fuenteDePoder(Superheroe, velocista(VelocidadMaxima)), VelocidadMaxima > 250000.
% esCanchero(Superheroe) :-
%   fuenteDePoder(Superheroe,radioactivo(Radiacion, _)) , Radiacion = alpha.

% Aca aplico polimorfismo
esCanchero(Superheroe) :- 
  superheroe(Superheroe), fuenteDePoder(Superheroe, Poder), 
  esCancheroElPoder(Poder).
esCancheroElPoder(millonario(Plata)) :- Plata >= 1000000.
esCancheroElPoder(velocista(VelocidadMaxima)) :- VelocidadMaxima > 250000.
esCancheroElPoder(radioactivo(Radiacion, _)) :- Radiacion = alpha.
esCancheroElPoder(multipoder(Poderes)) :- member(volar, Poderes).
esCancheroElPoder(multipoder(Poderes)) :- length(Poderes, Largo), Largo >= 10.

% --------------------------------------------------------------------------------------- %
%Mejor que otro, batman o mas integrantes
integrante(batman, ligaDeLaJusticia).
integrante(superman, ligaDeLaJusticia).
integrante(flash, ligaDeLaJusticia).
integrante(linternaVerde, ligaDeLaJusticia).

integrante(ironman, vengadores).
integrante(spiderman, vengadores).
integrante(hulk, vengadores).

esMejorQue(Equipo, OtroEquipo) :- 
  cantidadIntegrantes(Equipo, Cant1), cantidadIntegrantes(Equipo, Cant2), Cant1 > Cant2. 
esMejorQue(Equipo, OtroEquipo) :- 
  integrante(_, OtroEquipo), integrante(batman, Equipo), Equipo \= OtroEquipo.
%  findall(formato, consulta, lista)

cantidadIntegrantes(Equipo, Cant) :-
  integrante(_, Equipo), findall(Superheroe, integrante(Superheroe, Equipo), Superheroes),
  length(Superheroes, Cant).

