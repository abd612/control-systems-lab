%% Experiment Zero: Introduction to MATLAB

%% Vectors

a = [1 2 3 4 5 6 9 8 7]
%A row vector is a matrix having one row and one or more columns.

t = 0:2:20
%A vector is created with elements starting from first term to the last
%term having evenly spaced increments of the middle term.

b = a + 2
%A scalar is added to a vector which results in the addition of that scalar
%to each entry of the vector.

c = a + b
%Two vectors are added together resulting in the addition of their
%corresponding entries and the result is saved in another vector having the
%same dimensions. Only vectors having same dimensions can be added
%together.

%% Functions

sin(pi/4)
%Sine function is used which is a default function in MATLAB to evaluate
%the sine of the entry in the argument. The argument is assumed to be in
%radians.

%edit
%Edit command is used to open the MATLAB Editor/Debugger.

y = abdullah(166)
%The function abdullah created before is tested with a random input.

%% Plotting

t = 0:0.25:7;
%A vector is created with elements starting from first term to the last
%term having evenly spaced increments of the middle term.

y = sin(t);
%Sine function is used which is a default function in MATLAB to evaluate
%the sine of the entry in the argument. The argument is assumed to be in
%radians.

plot(t,y)
%Plot command generates a two dimensional line graph having first argument
%along x-axis and second argument along y-axis.

title('Sine Wave as a Function of Time')
%Title command is used to give a caption or a title to the graph that is
%generated using the plot command.

xlabel('Time(secs)')
%xlabel command is used to give a label to the x-axis of the graph that is
%previously generated using the plot command.

ylabel('Amplitude')
%ylabel command is used to give a label to the y-axis of the graph that is
%previously generated using the plot command.

%% Polynomials as Vectors

x = [1 3 -15 -2 9]
%In MATLAB, a polynomial is represented by a vector. A row vector is a
%matrix having one row and one or more columns. Each entry of the vector
%corresponds to the coefficients of the polynomial in descending order.

y = [1 0 0 0 1]
%In MATLAB, a polynomial is represented by a vector. MATLAB can interpret a
% vector of length n+1 as an nth order polynomial. Thus, if your polynomial
% is missing any coefficients, you must enter zeros in the appropriate
% place in the vector.

z = polyval([1 0 0 0 1],2)
%This command is used to evaluate the polynomial in first argument at the
%value given in the second argument.

roots([1 3 -15 -2 9])
%This command is used to generate the roots or the solutions of a
%polynomial.

x = [1 2]
%A row vector is a matrix having one row and one or more columns.

y = [1 4 8]
%A row vector is a matrix having one row and one or more columns.

z = conv(x,y)
%Conv command returns the convolution of its argument vectors . If they are
%vectors of polynomial coefficients, convolving them is equivalent to
%multiplying the two polynomials.

[xx,R] = deconv(z,y)
%Deconv command deconvolutes second vector out of the first vector using
%long division. If the vectors are polynomials, the deconvolution is
%polynomial division. The result gives the quotient as well as remainder if
%any.

%% Polynomials Using the s Variable

s = tf('s')
%Polynomials can also be represented using the Laplace variable s. This
%command is used to define a continuous-time transfer function variable.

polynomial = s^4 + 3*s^3 - 15*s^2 - 2*s + 9
%A polynomial can be created using the Laplace variable s instead of
%defining it using a vector.

zero(polynomial)
%Similar to roots command, zero command can be used to find the roots or
%the solution of the polynomial. But it is more versatile that that. Zero
%can be used to get zeros and gain of SISO dynamic system.

x = s + 2
%A polynomial can be created using the Laplace variable s.

y = s^2 + 4*s + 8
%A polynomial can be created using the Laplace variable s.

z = x * y
%Two polynomials are multiplied together and the result is stored in
%another polynomial having degree as the sum of the two starting
%polynomials. The polynomial has the same coefficients as the resulting
%vaector if the conv command is used.

%% Matrices

B = [1 2 3 4; 5 6 7 8; 9 10 11 12]
% A two dimensional matrix is a multi-dimensional array having two
% dimensions. Each row is separated by a semicolon or a return.

B = [ 1 2 3 4
    5 6 7 8
    9 10 11 12 ]
% A two dimensional matrix is a multi-dimensional array having two
% dimensions. Each row is separated by a semicolon or a return.

C = B'
%Transpose of a matrix is such a matrix in which the rows and columns are
%interchanged, i.e. previous rows become the new columns and previous
%columns become the new rows.

D = B * C
%Two matrices are multiplied together and the result is stored in another
%matrix. The matrices can only be multiplied if the number of columns of
%the first matrix is equal to the number of rows of the second matrix.
%Matrix multiplication is non-commutative.

D = C * B
%Two matrices are multiplied together and the result is stored in another
%matrix. The matrices can only be multiplied if the number of columns of
%the first matrix is equal to the number of rows of the second matrix.
%Matrix multiplication is non-commutative.

E = [1 2; 3 4]
% A two dimensional matrix is a multi-dimensional array having two
% dimensions. Each row is separated by a semicolon or a return.

F = [2 3; 4 5]
% A two dimensional matrix is a multi-dimensional array having two
% dimensions. Each row is separated by a semicolon or a return.

G = E .* F
%This multiplication multiplies the corresponding elements of the two
%matrices. The matrices must have same dimensions.

E^3
%A square matrix can be multiplied with itself as many times as required by
%raising it to that power.

E.^3
%This command raised the power of each eacj element in the matrix to the
%specified value.

X = inv(E)
%Inv command is used to find the inverse of a matrix. The condition is that
%the matrix must not be singular.

eig(E)
%Eg command returns a column vector containing the eigenvalues of a matrix.
%The matrix must be square. Eigenvalues are the same as the roots of a
%matrix's characteristic equation.

p = poly(E)
%This command returns the coefficients of the characteristic polynomial of
%a matrix.

roots(p)
%This command returns the solutions or the roots of the polynomial. The
%roots of the characteristic polynomial are same as the eigenvalues of it's
%matrix.

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 