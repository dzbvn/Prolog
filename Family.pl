rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

matka(X,Y) :-
    rodzic(X,Y),
    kobieta(X).

ojciec(X,Y) :-
    rodzic(X,Y),
    mezczyzna(X).
	
brat(X,Y) :-
    mezczyzna(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.

siostra(X,Y) :-
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.
	
dziadek(X,Y) :-
    mezczyzna(X),
    rodzic(Z, Y),
    rodzic(X, Z).

babcia(X,Y) :-
    kobieta(X),
    rodzic(Z, Y),
    rodzic(X, Z).

przodek(X,Y) :-
	rodzic(X,Y).
 
przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).
	
potomek(X,Y) :-
    rodzic(Y,X).

potomek(X,Z) :-
    rodzic(Y, X),
    przodek(Z, Y).
	
krewny(X,Y) :-
    przodek(Z,X),
    przodek(Z,Y),
    X \= Y.
	