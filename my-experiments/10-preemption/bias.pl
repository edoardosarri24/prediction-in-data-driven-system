%%% predicate %%%
% added 1 to the ariety of each predicate.
head_pred(failure,1).
body_pred(release_1,2).
body_pred(release_2,2).
body_pred(complete_1,2).
body_pred(complete_2,2).
body_pred(execute_1_1,2).
body_pred(execute_1_2,2).
body_pred(execute_2_1,2).
body_pred(finish_1_1,2).
body_pred(finish_1_2,2).
body_pred(finish_2_1,2).
body_pred(executionTime_1_1,2).
body_pred(executionTime_1_2,2).
body_pred(executionTime_2_1,2).
body_pred(preempt_1,2).
body_pred(preempt_2,2).

%%% type %%%
% types help to reduce the training time
type(failure,(trace,)). % with unary predicate use che "," after the type.
type(release_1,(trace,int)).
type(release_2,(trace,int)).
type(complete_1,(trace,int)).
type(complete_2,(trace,int)).
type(execute_1_1,(trace,int)).
type(execute_1_2,(trace,int)).
type(execute_2_1,(trace,int)).
type(finish_1_1,(trace,int)).
type(finish_1_2,(trace,int)).
type(finish_2_1,(trace,int)).
type(executionTime_1_1,(trace,int)).
type(executionTime_1_2,(trace,int)).
type(executionTime_2_1,(trace,int)).
type(preempt_1,(trace,int)).
type(preempt_2,(trace,int)).

%%% direction %%%
directions(failure,(in,)).
directions(release_1,(in,in)).
directions(release_2,(in,in)).
directions(complete_1,(in,in)).
directions(complete_2,(in,in)).
directions(execute_1_1,(in,in)).
directions(execute_1_2,(in,in)).
directions(execute_2_1,(in,in)).
directions(finish_1_1,(in,in)).
directions(finish_1_2,(in,in)).
directions(finish_2_1,(in,in)).
directions(executionTime_1_1,(in,in)).
directions(executionTime_1_2,(in,in)).
directions(executionTime_2_1,(in,in)).
directions(preempt_1,(in,in)).
directions(preempt_2,(in,in)).

%%% numerical predicates %%%
numerical_pred(geq,2).
type(geq,(int,int)).
directions(geq,(in,out)).

%%% bounds %%%
bounds(geq,1,(0,1000)).
