:- use_module(stats).


serie([e(4,1), e(5,4), e(6,10), e(7,20), e(8,35), e(9,56), e(10,84), e(11,120),
       e(12,165), e(13,220), e(14,282), e(15,348), e(16,415), e(17,480),
       e(18,540), e(19,592), e(20,633), e(21,660), e(22,670), e(23,660),
       e(24,633), e(25,592), e(26,540), e(27,480), e(28,415), e(29,348),
       e(30,282), e(31,220), e(32,165), e(33,120), e(34,84), e(35,56), e(36,35),
       e(37,20), e(38,10), e(39,4), e(40,1)]).

serie1([e(4,1), e(5,4), e(6,10), e(7,6)]).

% ---------------------------------
test1 :-
    serie(S),
    stats:nb_effectifs(S, N),
    writeln(N),
    halt.


test3 :-
    serie(S), 
    stats:effectifs_cumules(S, EC),
    writeln(EC),
    halt.

test4 :-
    serie(S),
    stats:quantile(S, 0.5, Q),
    writeln(Q),
    halt.

test5 :-
    serie(S),
    stats:fonctions_repartitions(S, Fs),
    writeln(Fs),
    halt.

test6 :-
    serie(S),
    stats:quantiles(S, 5, Qs),
    writeln(Qs),
    halt.

test7 :-
    serie(S),
    parties(S, 5, Parties),
    writeln(Parties),
    halt.
    

/* ================================ FIN LISTING ============================= */

