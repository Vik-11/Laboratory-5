start :-
    writeln('To count odd negative numbers in list enter count_odd_negative([your list, Count])'). 

count_odd_negative([], 0).
count_odd_negative([H|T], Count) :-
    count_odd_negative(T, Tail),
    (H < 0, H mod 2 =\= 0 -> Count is Tail + 1; Count is Tail).
