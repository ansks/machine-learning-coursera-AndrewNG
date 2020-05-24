function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

%z = [1 2 3; 2 3 4; 6 7 9];
% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%z = -50000;
%i =2;
for i = 1:size(z,1)
  for j = 1:size(z,2)    
    g(i,j) = 1/(1+exp(-z(i,j)));
  end
end
% =============================================================
end
