%Leoanrdo Roman
%Lab 1 exercise 7
%7 Compute the first and second derivative of x(t) = cos(t)
%for t = 0 and t = pi
syms t;
y = cos(t);

diff(y,t,1)%First derivative
limit(diff(y,t,1),t,0)
limit(diff(y,t,1),t,pi)

diff(y,t,2)%Second derivative
limit(diff(y,t,2),t,0)
limit(diff(y,t,2),t,pi)
