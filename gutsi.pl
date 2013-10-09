% Puzzle from Werner Hett's Prolog course. See the picture "gutsi.gif".
% https://sites.google.com/site/prologsite/prolog-course/a-first-glimpse

digit(0).
digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

% TODO Improve.
distinct(A, B, C, D, E, F) :-
    A =\= B, A =\= C, A =\= D, A =\= E, A =\= F,
    B =\= C, B =\= D, B =\= E, B =\= F,
    C =\= D, C =\= E, C =\= F,
    D =\= E, D =\= F,
    E =\= F.

sum(A1, A2, B1, B2, S1, S2) :-
    A is A1*10+A2, B is B1*10+B2, S is S1*10+S2, S is A+B.
diff(A1, A2, B1, B2, S1, S2) :-
    A is A1*10+A2, B is B1*10+B2, S is S1*10+S2, S is A-B.

% Herz, Lebkuchen, Brezel, Stern, Mond, Makrone.
puzzle(He, Le, Br, St, Mo, Ma) :-
    digit(He), digit(Le), digit(Br), digit(St), digit(Mo), digit(Ma),
    distinct(He, Le, Br, St, Mo, Ma),
    sum(He, He, Le, Br, St, Mo),
    sum(Ma, Le, 0, He, Ma, St),
    sum(Br, Le, Br, He, Ma, St),
    diff(He, He, Ma, Le, Br, Le),
    diff(Le, Br, 0, He, Br, He),
    diff(St, Mo, Ma, St, Ma, St).

% He = 6,
% Le = 3,
% Br = 2,
% St = 9,
% Mo = 8,
% Ma = 4 .
