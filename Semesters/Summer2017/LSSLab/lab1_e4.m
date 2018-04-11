%Leonardo Roman
%Lab 1 exercise 4
%4 Plot the fuctions f(x) = cos(2pix) 0<=x<=5
x = 0:5
f = cos(2.*pi*x);
plot(x,f)
%4.1 insert grid and legend
grid on
legend on
%4.2 Plot in the same figure g(x) = xe^-x 0<=x<=5
hold on
g = x.*exp(-x)
plot(x,g)
%4.3 Plot f(x) and g(x) in two different subgraphs
subplot(2,1,1)
plot(x,f)
subplot(2,1,2)

plot(x,g)
