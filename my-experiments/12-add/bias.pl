%%% predicate %%%
% added 1 to the ariety of each predicate.
head_pred(failure,1).
body_pred(release_1,3).
body_pred(release_2,3).
body_pred(complete_1,3).
body_pred(complete_2,3).
body_pred(execute_1_1,3).
body_pred(execute_1_2,3).
body_pred(execute_1_3,3).
body_pred(execute_2_1,3).
body_pred(finish_1_1,3).
body_pred(finish_1_2,3).
body_pred(finish_1_3,3).
body_pred(finish_2_1,3).
body_pred(executionTime_1_1,3).
body_pred(executionTime_1_2,3).
body_pred(executionTime_1_3,3).
body_pred(executionTime_2_1,3).

%%% type %%%
% types help to reduce the training time
type(failure,(trace,)). % with unary predicate use che "," after the type.
type(release_1,(trace, release_1, int)).
type(release_2,(trace, release_2, int)).
type(complete,(trace, release_1, int)).
type(complete,(trace, release_2, int)).
type(execute,(trace, release_1, int)).
type(execute,(trace, release_2, int)).
type(finish,(trace, release_1, int)).
type(finish,(trace, release_2, int)).
type(executionTime,(trace, release_1, int)).
type(executionTime,(trace, release_2, int)).

%%% direction %%%
directions(failure,(in,)).
directions(release_1,(in,out,in)).
directions(release_2,(in,out,in)).
directions(complete_1,(in,out,in)).
directions(complete_2,(in,out,in)).
directions(execute_1_1,(in,out,in)).
directions(execute_1_2,(in,out,in)).
directions(execute_1_3,(in,out,in)).
directions(execute_2_1,(in,out,in)).
directions(finish_1_1,(in,out,in)).
directions(finish_1_2,(in,out,in)).
directions(finish_1_3,(in,out,in)).
directions(finish_2_1,(in,out,in)).
directions(executionTime_1_1,(in,out,in)).
directions(executionTime_1_2,(in,out,in)).
directions(executionTime_1_3,(in,out,in)).
directions(executionTime_2_1,(in,out,in)).

%%% numerical predicates %%%
numerical_pred(geq,2).
type(geq,(int,int)).
directions(geq,(in,out)).
numerical_pred(add,3).
type(add,(int,int,int)).
directions(add,(in,in,out)).

%%% bounds %%%
bounds(geq,1,(0,2000)).
bounds(add,1,(0,2000)).
