start :-
    writeln('To find max and min digit in number enter max_min(your number, Max, Min)').

digits(0, Max, Min, Max, Min).

update(D, CurrMax, CurrMin, NewMax, NewMin) :-
    (D > CurrMax -> NewMax = D ; NewMax = CurrMax),
    (D < CurrMin -> NewMin = D ; NewMin = CurrMin).

digits(N, CurrMax, CurrMin, Max, Min) :-
    N > 0,
    D is N mod 10,
    update(D, CurrMax, CurrMin, NewMax, NewMin),
    N1 is N // 10,
    digits(N1, NewMax, NewMin, Max, Min).

max_min(Number, Max, Min) :-
    digits(Number, 0, 9, Max, Min).
