fluent(f).
action(a).

thing(A) :- action(A).
thing(F) :- fluent(F).
thing(t(F)) :- fluent(F).
thing(i(F)) :- fluent(F).

time(0..4).

holds(n(F),T) :- not holds(F,T), time(T), thing(F).

since(A,B,T) :- since(A,B,T-1), holds(A,T).
since(A,B,T) :- holds(B,T), thing(A).

%inertia
holds(f,T) :- time(T), since(n(t(f)),f,T).
%initiation
holds(f,T) :- time(T), holds(i(f),T-1).
%initial state
{holds(f,0)}.

#show.
#show h(A,B,C) : holds(A,B,C), A!=n(D), thing(D).
