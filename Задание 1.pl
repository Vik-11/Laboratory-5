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

start :-
    writeln('To find max and min digits in number enter Your number'),
    read(N),
    max_min(N, Max, Min),
    writeln(' Max is '), 
    write(Max), 
    write( 'Min is '), 
    write(Min).
