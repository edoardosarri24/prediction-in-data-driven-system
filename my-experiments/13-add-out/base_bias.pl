%%% predicate %%%
head_pred(failure, 1).
body_pred(task, 2).
body_pred(release_task, 2).
body_pred(chunk, 2).
body_pred(executionTime_task_chunk, 2).
body_pred(complete_task, 2).
body_pred(execute_task_chunk, 2).
body_pred(finish_task_chunk, 2).

%%% type %%%
type(failure,(trace,)).
type(task,(trace, releaseNumber_trace_task)).
type(chunk,(releaseNumber_trace_task, releaseNumber_trace_task_chunk)).
type(release_task,(releaseNumber_trace_task,int)).
type(executionTime_task_chunk,(releaseNumber_trace_task_chunk, int)).
type(complete_task,(releaseNumber_trace_task, int)).
type(execute_task_chunk,(releaseNumber_trace_task_chunk, int)).
type(finish_task_chunk,(releaseNumber_trace_task_chunk, int)).

%%% direction %%%
directions(failure, (in,)).
directions(task, (in,in)).
directions(chunk, (in,in)).
directions(release_task, (in,out)).
directions(executionTime_task_chunk, (in,out)).
directions(complete_task, (in,out)).
directions(execute_task_chunk, (in,out)).
directions(finish_task_chunk, (in,out)).

%%% numerical predicates %%%
numerical_pred(geq,2).
type(geq, (int,int)).
directions(geq, (in,out)).
numerical_pred(add,3).
type(add, (int,int,int)).
directions(add, (in,in,out)).

%%% bounds %%%
bounds(geq, 1, (0,1100)).

%%% upper bound %%%
max_vars(9).
max_body(10).