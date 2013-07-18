% getNNResults -- Run BPMLL on benchmark datasets, and return the predicted labels
% for test set.
%
% usage: [predictedLabels, rawOutputs, thresholds] = getNNResults(trainFile, testFile, numFeatures, numLabels, numHiddenUnits, trainingEpochs)
%
% This script runs BPMLL code on benchmark datasets with the same settings
% as published in [1].
% 
% References:
% [1] M.-L. Zhang and Z.-H. Zhou. Multilabel neural networks with applications to functional genomics and text categorization. IEEE Transactions on Knowledge and Data Engineering, 2006, 18(10): 1338-1351.
%
% Author: abhishek.kumar.ak@gmail.com (Abhishek Kumar)

function [predictedLabels, rawOutputs, thresholds] = getNNResults(trainFile, testFile, numFeatures, numLabels, numHiddenUnits, trainingEpochs)

% Model params, same as those used by authors of BPMLL
learning_rate = 0.05;
regularization_weight = 0.1;

% Read the data
alltraindata = dlmread(trainFile);
train_data = alltraindata(:, 1:numFeatures);
train_target = alltraindata(:, numFeatures + 1:numFeatures + numLabels)';
train_target = 2.*train_target - 1; % convert {0, 1} to {-1, +1}

alltestdata = dlmread(testFile);
test_data = alltestdata(:,1:numFeatures);
test_target = alltestdata(:,numFeatures+1:numFeatures+numLabels)';
test_target = 2.*test_target - 1; % convert {0, 1} to {-1, +1}
feature_limits = [(-1).*ones(numFeatures, 1), ones(numFeatures, 1)]; % All our training data ranges from [-1,1].

% Train the model
cd BPMLL-src
[nets, errors] = BPMLL_train(train_data, train_target, numHiddenUnits, learning_rate, trainingEpochs, 2, 2, regularization_weight, feature_limits);

% Get test set predictions
[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Threshold,Pre_Labels] = BPMLL_test(train_data,train_target,test_data,test_target,nets{trainingEpochs, 1});
cd ..

% Output evaluation metrics
fprintf('%s: \n', testFile);
fprintf('  Hamming loss = %f\n', HammingLoss);
fprintf('  RankingLoss = %f\n', RankingLoss);
fprintf('  OneError = %f\n', OneError);
fprintf('  Coverage = %f\n', Coverage);
fprintf('  Average_Precision = %f\n', Average_Precision);

% Return values
Pre_Labels = (Pre_Labels + 1)./2;
Outputs = (Outputs + 1)./2;
Threshold = (Threshold + 1)./2;

predictedLabels = Pre_Labels';
rawOutputs = Outputs';
thresholds = Threshold';
