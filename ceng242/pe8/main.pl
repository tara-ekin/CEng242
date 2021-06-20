:- module(main, [sum_age/2, max_age_of_hobby/3, person_in_range/4]).
:- [kb].

% DO NOT CHANGE THE UPPER CONTENT, WRITE YOUR CODE AFTER THIS LINE


% sum_age
sum_age_helper([], Acc, Acc).

sum_age_helper([Name|T], Acc, Res) :- person(Name, Age, _), Z is Acc+Age, sum_age_helper(T, Z, Res).

sum_age(NameList, TotalAge) :- sum_age_helper(NameList, 0, TotalAge).


% max_age_of_hobby
max_age_helper([], _, Acc, Acc).

max_age_helper([Name|T], Hobby, Acc, Res) :-
    person(Name, Age, Hobby),
    Age > Acc,
    max_age_helper(T, Hobby, Age, Res).
    
max_age_helper([Name|T], Hobby, Acc, Res) :-
    person(Name, Age, Hobby),
    Age =< Acc,
    max_age_helper(T, Hobby, Acc, Res).

max_age_helper([Name|T], Hobby, Acc, Res) :-
    person(Name, Age, Hobby2),
    Hobby \= Hobby2,
    max_age_helper(T, Hobby, Acc, Res).

max_age_of_hobby(NameList, Hobby, MaxAge) :- max_age_helper(NameList, Hobby, 0, MaxAge).


% person_in_range
range_helper([], _, _, Acc, Acc).

range_helper([H|T], Age, Age, Acc, Res) :-
    person(H, Age, _),
    append(Acc, [H], Z),
    range_helper(T, Age, Age, Z, Res).

range_helper([H|T], Min, Max, Acc, Res) :-
    person(H, Age, _),
    Age > Min, Age =< Max,
    append(Acc, [H], Z),
    range_helper(T, Min, Max, Z, Res).

range_helper([H|T], Min, Max, Acc, Res) :-
    person(H, Age, _),
    Age < Min,
    range_helper(T, Min, Max, Acc, Res).
    
range_helper([H|T], Min, Max, Acc, Res) :-
    person(H, Age, _),
    Age > Max,
    range_helper(T, Min, Max, Acc, Res).

person_in_range(NameList, Min, Max, ResultList) :- range_helper(NameList, Min, Max, [], ResultList).
