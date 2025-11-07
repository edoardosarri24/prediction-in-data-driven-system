%%% predicate %%%
head_pred(failure, 1).
body_pred(task1, 2).
body_pred(task2, 2).
body_pred(release_task1, 2).
body_pred(release_task2, 2).
body_pred(chunk0, 2).
body_pred(chunk1, 2).
body_pred(chunk2, 2).
body_pred(executionTime_task1_chunk1, 2).
body_pred(executionTime_task1_chunk2, 2).
body_pred(executionTime_task1_chunk3, 2).
body_pred(executionTime_task2_chunk1, 2).
body_pred(complete_task1, 2).
body_pred(complete_task2, 2).
body_pred(execute_task1_chunk1, 2).
body_pred(execute_task1_chunk2, 2).
body_pred(execute_task1_chunk3, 2).
body_pred(execute_task2_chunk1, 2).
body_pred(finish_task1_chunk1, 2).
body_pred(finish_task1_chunk2, 2).
body_pred(finish_task1_chunk3, 2).
body_pred(finish_task2_chunk1, 2).

%%% type %%%
type(failure,(trace,)).
type(task1,(trace, releaseNumber_trace_task)).
type(task2,(trace, releaseNumber_trace_task)).
type(chunk0,(releaseNumber_trace_task, releaseNumber_trace_task_chunk)).
type(chunk1,(releaseNumber_trace_task, releaseNumber_trace_task_chunk)).
type(chunk2,(releaseNumber_trace_task, releaseNumber_trace_task_chunk)).
type(release_task1,(releaseNumber_trace_task,int)).
type(release_task2,(releaseNumber_trace_task,int)).
type(executionTime_task1_chunk1,(releaseNumber_trace_task_chunk, int)).
type(executionTime_task1_chunk2,(releaseNumber_trace_task_chunk, int)).
type(executionTime_task1_chunk3,(releaseNumber_trace_task_chunk, int)).
type(executionTime_task2_chunk1,(releaseNumber_trace_task_chunk, int)).
type(complete_task1,(releaseNumber_trace_task, int)).
type(complete_task2,(releaseNumber_trace_task, int)).
type(execute_task1_chunk1,(releaseNumber_trace_task_chunk, int)).
type(execute_task1_chunk2,(releaseNumber_trace_task_chunk, int)).
type(execute_task1_chunk3,(releaseNumber_trace_task_chunk, int)).
type(execute_task2_chunk1,(releaseNumber_trace_task_chunk, int)).
type(finish_task1_chunk1,(releaseNumber_trace_task_chunk, int)).
type(finish_task1_chunk2,(releaseNumber_trace_task_chunk, int)).
type(finish_task1_chunk3,(releaseNumber_trace_task_chunk, int)).
type(finish_task2_chunk1,(releaseNumber_trace_task_chunk, int)).

%%% direction %%%
directions(failure, (in,)).
directions(task1, (in,in)).
directions(task2, (in,in)).
directions(release_task1, (in,in)).
directions(release_task2, (in,in)).
directions(executionTime_task1_chunk1, (in,in)).
directions(executionTime_task1_chunk2, (in,in)).
directions(executionTime_task1_chunk3, (in,in)).
directions(executionTime_task2_chunk1, (in,in)).
directions(complete_task1, (in,in)).
directions(complete_task2, (in,in)).
directions(execute_task1_chunk1, (in,in)).
directions(execute_task1_chunk2, (in,in)).
directions(execute_task1_chunk3, (in,in)).
directions(execute_task2_chunk1, (in,in)).
directions(finish_task1_chunk1, (in,in)).
directions(finish_task1_chunk2, (in,in)).
directions(finish_task1_chunk3, (in,in)).
directions(finish_task2_chunk1, (in,in)).

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
