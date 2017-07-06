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

% Es canchero -> millonario(>1000000); radioactivo(alpha,_); velocista(>250000).

% esCanchero(Superheroe) :- [REPITO LOGICA!]
%   fuenteDePoder(Superheroe, millonario(Plata)), Plata >= 1000000.
% esCanchero(Superheroe) :-
%   fuenteDePoder(Superheroe, velocista(VelocidadMaxima)), VelocidadMaxima > 250000.
% esCanchero(Superheroe) :-
%   fuenteDePoder(Superheroe,radioactivo(Radiacion, _)) , Radiacion = alpha.

esCanchero(Superheroe) :- 
  superheroe(Superheroe), fuenteDePoder(Superheroe, Poder), 
  esCancheroElPoder(Poder).
% Aca aplico polimorfismo
esCancheroElPoder(millonario(Plata)) :- Plata >= 1000000.
esCancheroElPoder(velocista(VelocidadMaxima)) :- VelocidadMaxima > 250000.
esCancheroElPoder(radioactivo(Radiacion, _)) :- Radiacion = alpha.
