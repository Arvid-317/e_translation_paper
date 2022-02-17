fluent(f).
action(a).

thing(A) :- action(A).
thing(F) :- fluent(F).
thing(t(F)) :- fluent(F).
thing(i(F)) :- fluent(F).

time(0..4).

since(T) :- not holds(t_f,T-1), since(T-1).
since(T) :- holds(f,T-1), not holds(t_f,T-1).

%inertia
holds(f,T) :- time(T), since(T).
%initiation
holds(f,T) :- time(T), holds(i_f,T-1).
%initial state
{holds(f,0)}.

#show.
#show h(A,B,C) : holds(A,B,C), A!=n(D), thing(D).
