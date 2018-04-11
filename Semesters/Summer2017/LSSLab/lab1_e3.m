%Leonardo Roman
%Lab 1 exercise 3
%Create matricies A and B
A = [1 3 -6;2 8 11;2 1 1]
B = [1 2 3;4 5 6]
%3.1 Compute the sizes of the matrices
size(A)
size(B)
%3.2 Find the transpose matrix of B and store in a matrix c.
C = B'
%3.3 Create a matrix D by placiong the elements of C next to the elements
%of A
D = [A C]
%3.4 Export the second row of A
A(2,:)
%3.5 Export the first and third column of A
A(:,1)
A(:,3)
%3.6 Export the second and third row of A
A(2,:)
A(3,:)
%3.7 Compute [A]*[A]^-1
A*inv(A)
%3.8 Compute A^2
A*A
