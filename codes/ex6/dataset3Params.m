function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

valC = [.01;.03;.1;.3;1;3;10;30];  %%Values provided to check using validation error
valSigma = [.01;.03;.1;.3;1;3;10;30]; 

%error_Val = zeros(length(valC)*length(valSigma),3);
error_Val = []; %%Creating NULL matrix and First Col = valC(Regularization Parameter)
                %%Second Col = valSigma sigmaSq value
                %%Misclassified Classes

for i = 1:size(valC)
  for j = 1:size(valSigma)
    model= svmTrain(X, y, valC(i), @(x1, x2) gaussianKernel(x1, x2, valSigma(j)));
    prediction_val = svmPredict(model,Xval);
    error_Val = [error_Val;valC(i),valSigma(j),mean(double(prediction_val~=yval))];
  end
end

%%%%%%%Finding min value and index
[value, index] = min(error_Val(:,3));

%%%%%%%%%%% Updating value of C and sigma  %%%%%%%%%%  
C = error_Val(index,1);
sigma = error_Val(index,2);
  
% =========================================================================

end
