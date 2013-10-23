% 1.01. Find the last element of a list.

last_([X], X).
last_([_|T], X) :- last_(T, X).
