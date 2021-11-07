# Sprawozdanie Prolog
Szymon Klempert
## 1. Programowanie w prologu
### Prosty program

```
rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
 
kobieta(kasia).
kobieta(eliza).
 
mezczyzna(tomek).
mezczyzna(robert).
```

```
?- kobieta(X).
```
#### Wynik
```
X = kasia
```
 ';'

```
X = eliza
```

### Wyświetlanie bazy wiedzy 
#### Predykat
```
?- listing.
```
#### Wynik 
```
nl :-
    pengine_nl.

flush_output :-
    pengine_flush_output.

portray_clause(A) :-
    pengine_portray_clause(A).

listing(A) :-
    pengine_listing(A).

writeq(A) :-
    pengine_writeq(A).

read_line_to_string(A, B) :-
    pengine_read_line_to_string(A, B).

read(A) :-
    pengine_read(A).

:- dynamic screen_property/1.

screen_property(height(466.337)).
screen_property(width(721.2)).
screen_property(rows(31)).
screen_property(cols(101)).

write_term(A, B) :-
    pengine_write_term(A, B).

read_line_to_codes(A, B) :-
    pengine_read_line_to_codes(A, B).

write(A) :-
    pengine_write(A).

print(A) :-
    pengine_print(A).

kobieta(kasia).
kobieta(eliza).

format(A) :-
    pengine_format(A).

listing :-
    pengine_listing.

tab(A) :-
    pengine_tab(A).

display(A) :-
    pengine_display(A).

writeln(A) :-
    pengine_writeln(A).

write_canonical(A) :-
    pengine_write_canonical(A).

format(A, B) :-
    pengine_format(A, B).

rodzic(kasia, robert).
rodzic(tomek, robert).
rodzic(tomek, eliza).

mezczyzna(tomek).
mezczyzna(robert).
```
#### Predykat
```
?- listing(rodzic).
```
#### Wynik
```
rodzic(kasia, robert).
rodzic(tomek, robert).
rodzic(tomek, eliza).
```
---
#### Pytanie
```
?- rodzic(_,robert).
```
#### Wynik
```
true
```
---
### Zadawanie celu (pytań)
> Tam, gdzie to możliwe, używam ';', aby uzyskać wszystkie wyniki.

#### Pytanie
```
?- mezczyzna(X).
```
#### Wynik
```
X = tomek
X = robert
```
---
#### Pytanie
```
?- mezczyzna(tomek).
```
#### Wynik
```
true
```
---
#### Pytanie
```
?- mezczyzna(reksio).
```
#### Wynik
```
false
```
---
#### Pytanie
```
?- rodzic(kasia,robert).
```
#### Wynik
```
true
```
---
#### Pytanie
```
?- rodzic(kasia,X).
```
#### Wynik
```
X = robert
```
---
#### Pytanie
```
?- rodzic(Y,robert).
```
#### Wynik
```
Y = kasia
Y = tomek
```

#### 😎 Czy zamiast Y można wpisać inny symbol?
Tak, o ile jest niewiadomą - musi zaczynać się dużą literą.

### Rozbudowa programu

```
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
```
#### 😎 Czy kolejność wpisywania linii ma znaczenie?
 Nie, kolejność wpisywania linii nie ma znaczenia.

#### 😎 Jeżeli koniunkcję celów oznaczamy przecinkiem, to jak zapytać kto jest matką, a kto ojcem roberta?
```
?- rodzic(X,robert), kobieta(X), rodzic(Z,robert), mezczyzna(Z).
```
#### Wynik
```
X = kasia,
Z = tomek
```
    
### Czy Prolog jest po polsku?

#### 😎 Czy nazwa użytych symboli wpływa na działanie programu? Jakie są ograniczenia na używane symbole?

### Reguły wnioskowania

```
matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).
```
#### Pytanie
```
?- matka(X, robert).
```
#### Wynik
```
X = kasia
```
---
#### Pytanie
```
?- ojciec(X, robert).
```
#### Wynik
```
X = tomek
```
#### 😎 Proszę zdefiniować reguły opisujące: brata, siostrę, dziadka i babcię. Proszę dokładnie sprawdzić ich działanie.

#### Brat
```
brat(X,Y) :-
    mezczyzna(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.
```
##### Test 
```
?- brat(X, eliza).
```
```
X = robert
```
---

#### Siostra
```
siostra(X,Y) :-
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.
```
##### Test 
```
?- siostra(X, robert).
```
```
X = eliza
```
---
#### Dziadek
```
dziadek(X,Y) :-
    mezczyzna(X),
    rodzic(Z, Y),
    rodzic(X, Z).
```
##### Test 
```
?- dziadek(X, magda).
```
```
X = tomek
```
---
#### Babcia
```
babcia(X,Y) :-
    kobieta(X),
    rodzic(Z, Y),
    rodzic(X, Z).
```
##### Test 
```
?- babcia(X, magda).
```
```
X = kasia
```
Przy bracie i siostrze trzeba pamiętać o `X \= Y`, gdyż bez tego może pojawić się problem typu Robert będzie bratem Roberta.


### Reguły rekurencyjne

#### Potomek
```
potomek(X,Y) :-
    rodzic(Y,X).

potomek(X,Z) :-
	rodzic(Y, X),
    przodek(Z, Y).
```
##### Test
```
?- potomek(X, tomek).
```
```
X = robert
X = eliza
X = anna
X = magda
X = jan
```

#### Krewny
```
krewny(X,Y) :-
    przodek(Z,X),
    przodek(Z,Y),
    X \= Y.
```

## 2. Obserwacje
### Klasyczny program
```
?- write('Hello world'), nl.
```
```
Hello world
true
```

## 3. Arytmetyka w Prologu
#### Ćwiczenie
```
?- X is 2 + 2.
```

```
X = 4
```
---
```
?- Y is 2.5 + ( 4 / 2).
```

```
Y = 4.5
```
---
```
?- Z is 2 + 0.001.
```

```
Z = 2.001
```
---
```
?- A is 3.
```
```
A = 3
```
---
#### 😎 Napisz program obliczający wynik równania kwadratowego (Quadratic Equation) ax^2 + bx + c = 0 w dziedzinie liczb rzeczywistych. Zaimplementuj predykaty:

- delta/4 – obliczający deltę, argumenty kolejno: a, b, c, wynik,
- kwadrat/4 – obliczający wynik równania kwadratowego, argumenty kolejno: a, b, c, wynik.

```
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
```
