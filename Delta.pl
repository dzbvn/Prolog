delta(A, B, C, Wynik) :-
    Wynik is B*B - 4*A*C.
          
          
kwadrat(A, B, C, Wynik) :-
    delta(A, B, C, Wynik),
    Wynik > 0,
    X1 is (-B - sqrt(Wynik))/(2*A),
    X2 is (-B + sqrt(Wynik))/(2*A),
    write('X1 = '), write(X1), nl,
	write('X2 = '), write(X2).
	
kwadrat(A, B, C, Wynik) :-
    delta(A, B, C, Wynik),
    Wynik = 0,
    X is (-B)/(2*A),
    write('X = '), write(X),nl.
	
kwadrat(A, B, C, Wynik) :-
    delta(A, B, C, Wynik),
    Wynik < 0,
    write('Delta < 0'), nl.