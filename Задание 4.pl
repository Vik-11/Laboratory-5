start :-
    writeln('To solve logic problem about teachers enter solve(M, V, T)').

teachers([morozov, vasiliev, tokarev]).
subjects([history, math, biology, geography, english, french]).

solve(Morozov, Vasiliev, Tokarev) :-

    subjects(Subjects),
    permutation(Subjects, [M1, M2, V1, V2, T1, T2]),
    
    Morozov = [M1, M2],
    Vasiliev = [V1, V2],
    Tokarev = [T1, T2],
    
    all_different([M1, M2, V1, V2, T1, T2]),
    
    % 1. Географ и учитель французского - соседи
    ( (member(geography, Morozov), member(french, Vasiliev))
    ; (member(geography, Vasiliev), member(french, Tokarev))
    ; (member(geography, Tokarev), member(french, Vasiliev))
    ; (member(geography, Tokarev), member(french, Morozov))
    ),
    
    % 2. Биолог старше математика, а Морозов самый молодой
    ( (member(biology, Vasiliev), member(math, Tokarev))
    ; (member(biology, Tokarev), member(math, Vasiliev))
    ),
    \+ member(biology, Morozov),
    \+ member(math, Morozov),
    
    % 3. Понедельник: Токарев, биолог и учитель французского
    ( (member(biology, Vasiliev), member(french, Morozov))
    ; (member(biology, Morozov), member(french, Vasiliev))
    ),
    \+ member(biology, Tokarev),
    \+ member(french, Tokarev),
    
    % 4. Воскресенье: Морозов, математик и англичанин
    ( (member(math, Tokarev), member(english, Vasiliev))
    ; (member(math, Vasiliev), member(english, Tokarev))
    ),
    \+ member(math, Morozov),
    \+ member(english, Morozov).

all_different(List) :-
    sort(List, Sorted),
    length(List, Len),
    length(Sorted, Len).
