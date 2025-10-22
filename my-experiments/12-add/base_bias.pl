%%% predicate %%%
% added 1 to the ariety of each predicate.
head_pred(failure,1).
body_pred(release,3).
body_pred(complete,3).
body_pred(execute,3).
body_pred(finish,3).
body_pred(executionTime,3).

%%% type %%%
% types help to reduce the training time
type(failure,(trace,)). % with unary predicate use che "," after the type.
type(release,(trace,release,int)).
type(complete,(trace,release,int)).
type(execute,(trace,release,int)).
type(finish,(trace,release,int)).
type(executionTime,(trace,release,int)).

%%% direction %%%
directions(failure,(in,)).
directions(release,(in,out,in)).
directions(complete,(in,out,in)).
directions(execute,(in,out,in)).
directions(finish,(in,out,in)).
directions(executionTime,(in,out,in)).

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