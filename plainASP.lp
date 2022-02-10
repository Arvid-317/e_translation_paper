thing(f).
thing(a).
time(0..4).

%trigger def
trigger(Trig,Elem,T) :- not time(T-1), holds(Elem,T), thing(Trig).
trigger(Trig,Elem,T) :- holds(Elem,T), holds(Trig,T).
trigger(Trig,Elem,T) :- holds(Elem,T), trigger(Trig,Elem,T-1).

holds(nt_f,T) :- not holds(t_f,T), time(T).

%inertia
holds(f,T) :- time(T), trigger(f,nt_f,T-1).
%initiation
%holds(f,T) :- time(T), holds(i_f,T-1).
%initial state
{holds(f,0)}.

#show holds/2.
