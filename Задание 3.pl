start :-
    writeln('To check de Morgans law enter command demorgan_int ([your 1st set], [your 2nd set])').

universal([0,1,2,3,4,5,6,7,8,9]).

complement(A, CompA) :-
    universal(U),
    subtract(U, A, CompA).

union([], B, B).
union([H|T], B, Union) :-
    member(H, B), !,
    union(T, B, Union).
union([H|T], B, [H|Union]) :-
    union(T, B, Union).

intersection([], _, []).
intersection([H|T], B, [H|Inter]) :-
    member(H, B), !,
    intersection(T, B, Inter).
intersection([_|T], B, Inter) :-
    intersection(T, B, Inter).

% -(A n B) = -A u -B
demorgan_int(A, B) :-
    intersection(A, B, IntAB),
    complement(IntAB, S1),
    complement(A, CompA),
    complement(B, CompB),
    union(CompA, CompB, S2),
    sort(S1, SortedS1),
    sort(S2, SortedS2),
    writeln(SortedS1),
    writeln(SortedS2), 
    SortedS1 == SortedS2.

    
