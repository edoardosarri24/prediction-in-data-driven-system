%%% predicate %%%
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
type(failure,(trace,)).
type(release_1,(trace,release_number,int)).
type(release_2,(trace,release_number,int)).
type(complete_1,(trace,release_number,int)).
type(complete_2,(trace,release_number,int)).
type(execute_1_1,(trace,release_number,int)).
type(execute_1_2,(trace,release_number,int)).
type(execute_1_3,(trace,release_number,int)).
type(execute_2_1,(trace,release_number,int)).
type(finish_1_1,(trace,release_number,int)).
type(finish_1_2,(trace,release_number,int)).
type(finish_1_3,(trace,release_number,int)).
type(finish_2_1,(trace,release_number,int)).
type(executionTime_1_1,(trace,release_number,int)).
type(executionTime_1_2,(trace,release_number,int)).
type(executionTime_1_3,(trace,release_number,int)).
type(executionTime_2_1,(trace,release_number,int)).

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
bounds(geq,1,(0,1100)).
