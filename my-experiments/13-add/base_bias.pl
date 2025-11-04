%%% predicate %%%
head_pred(failure,1).
body_pred(task,2).
body_pred(release_task,2).
body_pred(executionTime_task_chunk,2).
body_pred(complete_task,2).
body_pred(execute_task_chunk,2).
body_pred(finish_task_chunk,2).

%%% type %%%
type(failure,(trace,)).
type(task,(trace,releaseNumber_trace)).
type(release_task,(releaseNumber_trace,int)).
type(executionTime_task_chunk,(releaseNumber_trace,int)).
type(complete_task,(releaseNumber_trace,int)).
type(execute_task_chunk,(releaseNumber_trace,int)).
type(finish_task_chunk,(releaseNumber_trace,int)).

%%% direction %%%
directions(failure,(in,)).
directions(task,(in,in)).
directions(release_task,(in,in)).
directions(executionTime_task_chunk,(in,in)).
directions(complete_task,(in,in)).
directions(execute_task_chunk,(in,in)).
directions(finish_task_chunk,(in,in)).

%%% numerical predicates %%%
numerical_pred(geq,2).
type(geq,(int,int)).
directions(geq,(in,out)).
numerical_pred(add,3).
type(add,(int,int,int)).
directions(add,(in,in,out)).

%%% bounds %%%
bounds(geq,1,(0,1100)).