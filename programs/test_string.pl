:- use_module(string).


test_string :-
	string:atom_to_structured_string(p(q(alk,bljki,clkj), adsf,bsqdf), S),
	writeln(S),
	halt(0).


