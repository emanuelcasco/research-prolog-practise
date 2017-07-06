largoLista([], 0).
largoLista([X|Xs], Total) :-
  largoLista(Xs, Subtotal), Total is 1 + Subtotal.

sumarLista([], 0).
sumarLista([X|Xs], Total) :-
  sumarLista(Xs, Subtotal), Total is X + Subtotal.