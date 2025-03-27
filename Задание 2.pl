count_odd_negative([], 0).
count_odd_negative([H|T], Count) :-
    count_odd_negative(T, CTail),
    (H < 0, H mod 2 =\= 0 -> Count is CTail + 1; Count = CTail).

start :-
    writeln('To count odd negative numbers in list enter Your list in form [1,2,3,4]'),
    read(List),
    count_odd_negative(List, Count),
    write('Quantity of odd negative numbers in list is '),
    write(Count),
    !.
